import json,re
from pathlib import Path
root=Path('C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern')
base=root/'pvzPerf'
result=[]
for path in sorted(base.rglob('*')):
    if path.suffix not in ('.cpp','.h','.mm','.inl'):continue
    if any(x in path.parts for x in ('generated','shaders','tests')):continue
    text=path.read_text(encoding='utf-8-sig',errors='replace')
    # Preserve offsets/newlines while removing comments and string literal
    # bodies, so initializer braces/semicolons inside text cannot affect scope.
    mask=re.sub(r'//[^\n]*|/\*[\s\S]*?\*/|R"([^ ()\\\t\r\n]{0,16})\([\s\S]*?\)\1"|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'',
        lambda m: ''.join('\n' if c=='\n' else ' ' for c in m.group()),text)
    function_at=[False]*(len(mask)+1)
    stack=[]
    last_boundary=0
    for index,char in enumerate(mask):
        function_at[index]=any(stack)
        if char=='{':
            prefix=mask[last_boundary:index].strip()
            function=bool(re.search(r'\)\s*(?:(?:const|override|final|noexcept)\s*)*(?:->[^{};]+)?$',prefix))
            if re.match(r'^(if|for|while|switch|catch)\b',prefix):function=False
            stack.append(function)
            last_boundary=index+1
        elif char=='}':
            if stack:stack.pop()
            last_boundary=index+1
        elif char==';':last_boundary=index+1
    for match in re.finditer(r'(?m)^[ \t]*(?:(?:constexpr|constinit|const)\s+[^;\n]*(?:\[[^\n]*\]|std::array|std::vector)|(?:constexpr|constinit|const)\s+struct\b|(?:constexpr|const)\s+auto\s+\w+\s*=\s*(?:std::array|std::to_array))',mask):
        if not function_at[match.start()]:continue
        pos=match.start();depth=0;end=pos
        for end in range(pos,len(mask)):
            c=mask[end]
            if c in '{[(':depth+=1
            elif c in '}])':depth-=1
            elif c==';' and depth==0:break
        source=text[pos:end+1].strip()
        # A line such as const auto& row=table[index] is a read, not an array declaration.
        header=source.split('=',1)[0]
        if 'auto' in header and not any(x in source for x in ('std::array','std::to_array')):continue
        if '[' not in header and 'std::array' not in header and 'std::vector' not in header and 'struct' not in header:continue
        result.append({'file':path.relative_to(root).as_posix(),'line':text.count('\n',0,pos)+1,
                       'declaration':source[:4000]})
output=Path.home()/'AppData/Local/Temp/pvz-static-storage-candidates-20261029.json'
output.write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
print('LOCAL CANDIDATES',len(result))
for row in result:
    print(row['file']+':'+str(row['line']),row['declaration'].splitlines()[0][:135])
