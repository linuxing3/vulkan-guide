b:
    cmake -B build && cmake --build build
    # cp build/compile_commands .

shaders:
    #!/usr/bin/env bash
    ./shaders.sh
    
c0:
    #!/usr/bin/env bash
    pushd ./build/bin
    ./chapter_0
    popd

c1:
    #!/usr/bin/env bash
    pushd ./build/bin
    ./chapter_1
    popd

c2:
    #!/usr/bin/env bash
    pushd ./build/bin
    ./chapter_2
    popd

c3:
    #!/usr/bin/env bash
    pushd ./build/bin
    ./chapter_3
    popd

c4:
    #!/usr/bin/env bash
    pushd ./build/bin
    ./chapter_4
    popd

c5:
    #!/usr/bin/env bash
    pushd ./build/bin
    ./chapter_5
    popd

c6:
    #!/usr/bin/env bash
    pushd ./build/bin
    ./chapter_6
    popd
