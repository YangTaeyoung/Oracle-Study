-- ● 트렌젝션의 예시.
-- > 개념적으로 중요
-- > 예) A라는 계좌에 있는 100만원을 B라는 계좌에 이체할 경우. 업데이트가 2번 필요. 
-- > ① A계좌에 100만원을 빼는 UPDATE문 ② B계좌에 100만원을 더해주는 UPDATE문
-- > 여기서 만약 천재지변(전쟁, 환경재해) 등이 일어나서 
-- > A계좌에 100만원을 빼는 UPDATE문은 실행되었으나, B계좌에 100만원을 추가해주는 UPDATE문이 실행되지 않았을 경우.
-- > 이것을 방지하기 위한 코드가 필요함.(트랜젝션)

-- ● 트렌젝션
-- > 더 이상 분할할 수 없는 촤소수행단위.
-- > 어떤 기능 한 가지를 수행하는 'SQL덩어리'
-- > 여러 개의 작업 명령어를 하나의 작업 구성단위로 묶어 놓은 것.
-- > 데이터의 변경을 초래하는 DML명령어에만 해당됨.
-- > 어느 정도까지는 데이터베이스에서 자동으로 처리해줌.
-- > 다 수행하던가, 아무것도 하지 말던가: 'ALL OR NOTHING'

-- ● 트렌젝션은 데이터 접속 직후 바로 만들어짐.
-- > 그 다음에 insert, update, delete 등 여러 명령어를 실행.
-- > tcl 명령어를 사용해서 현재 트렌젝션을 종료하고, 새로운 트렌젝션을 생성할 수 있다.

-- > 예) 이미 존재하는 문서파일이 존재.
-- > 문장을 수정, 삭제, 삽입이 이루어졌음.
-- > 저장하시겠습니까? 1. 예(commit)  2. 아니오(rollback)
-- ※ commit: 지금까지 작업한 내용을 영구히 반영함.
-- ※ rollback: 지금까지 작업한 내용을 취소하겠음.

-- DML(insert, uodate, delete)이외에
-- DDL(create, alter, drop)명령어는 실행되자마자 auto-commit 효과를 가진다.

-- 즉 DDL문은 실행자체로 트렌젝션 제어로 관여한다.
-- 만약 insert, update, delete를 하고 나서, create 테이블을 생성하는 명령을 사용한 후 rollback해도 위의 insert, update delete는 취소되지 않는다.
-- create으로 이미 commit가 실행된 효과를 가지기 때문에.