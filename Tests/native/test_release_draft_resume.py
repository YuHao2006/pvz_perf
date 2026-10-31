import importlib.util
from pathlib import Path
import unittest
from urllib.error import HTTPError


spec = importlib.util.spec_from_file_location(
    'publisher', Path(__file__).resolve().parents[2] / 'tools/publish-github-release.py')
publisher = importlib.util.module_from_spec(spec)
spec.loader.exec_module(publisher)


class ReleaseDraftResumeTests(unittest.TestCase):
    def test_published_release_needs_no_list_or_create(self):
        calls = []
        def request(method, url, data=None):
            calls.append((method, url))
            return {'id': 3}
        self.assertEqual(publisher.resolve_release(request, 'api', 'v3.2.3', 'abc', '')['id'], 3)
        self.assertEqual(calls, [('GET', 'api/releases/tags/v3.2.3')])

    def test_interrupted_draft_uses_most_completed_uploads(self):
        calls = []
        def request(method, url, data=None):
            calls.append((method, url))
            if '/tags/' in url:
                raise HTTPError(url, 404, '', {}, None)
            return [
                {'id': 1, 'tag_name': 'v3.2.3', 'target_commitish': 'abc',
                 'assets': [{'state': 'uploaded'}, {'state': 'uploaded'}]},
                {'id': 2, 'tag_name': 'v3.2.3', 'target_commitish': 'abc',
                 'assets': [{'state': 'uploaded'}, {'state': 'starter'}]},
            ]
        self.assertEqual(publisher.resolve_release(request, 'api', 'v3.2.3', 'abc', '')['id'], 1)
        self.assertTrue(all(method == 'GET' for method, _ in calls))

    def test_draft_list_is_paginated(self):
        def request(method, url, data=None):
            if '/tags/' in url:
                raise HTTPError(url, 404, '', {}, None)
            if url.endswith('&page=1'):
                return [{'tag_name': 'other'} for _ in range(100)]
            return [{'id': 9, 'tag_name': 'v3.2.3', 'target_commitish': 'abc'}]
        self.assertEqual(publisher.resolve_release(request, 'api', 'v3.2.3', 'abc', '')['id'], 9)

    def test_create_only_when_release_is_absent(self):
        created = []
        def request(method, url, data=None):
            if '/tags/' in url:
                raise HTTPError(url, 404, '', {}, None)
            if method == 'GET':
                return []
            created.append(data)
            return {'id': 8}
        self.assertEqual(publisher.resolve_release(request, 'api', 'v3.2.3', 'abc', 'notes')['id'], 8)
        self.assertEqual(len(created), 1)
        self.assertEqual(created[0]['target_commitish'], 'abc')

    def test_wrong_commit_and_permission_failure_are_not_recreated(self):
        def mismatch(method, url, data=None):
            if '/tags/' in url:
                raise HTTPError(url, 404, '', {}, None)
            return [{'id': 1, 'tag_name': 'v3.2.3', 'target_commitish': 'wrong'}]
        with self.assertRaises(RuntimeError):
            publisher.resolve_release(mismatch, 'api', 'v3.2.3', 'abc', '')
        def denied(method, url, data=None):
            raise HTTPError(url, 403, '', {}, None)
        with self.assertRaises(HTTPError) as caught:
            publisher.resolve_release(denied, 'api', 'v3.2.3', 'abc', '')
        caught.exception.close()


if __name__ == '__main__':
    unittest.main()
