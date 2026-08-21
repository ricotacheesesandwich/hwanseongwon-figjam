# 공동 사건 조사 보드

FigJam / 사건수사 보드처럼 사진과 메모를 자유롭게 배치하고 붉은 선으로 실마리를 연결하는 조사 협업 사이트입니다.

## 현재 구현 기능

- 지정된 접속 번호로만 로그인
- 관리자 / 플레이어 권한 분리
- 관리자 플레이어 번호 추가
- 관리자 플레이어 접속 차단 / 차단 해제
- 차단되어도 해당 플레이어의 기존 자료·포스트잇·사진 스티커·연결선은 유지
- 같은 브라우저의 이미 접속 중인 탭에도 차단 상태 반영
- 사건 조사 자료 카드 생성
- 조사 자료에 사진 / PDF / 텍스트 계열 파일 첨부
- 포스트잇 작성 및 색상 선택
- 기호 스티커 배치
- 사용자가 사진을 올려 독립된 사진 스티커로 배치
- 모든 보드 항목 자유 드래그
- 두 항목을 붉은 선으로 연결
- 붉은 연결선에 관계 설명 작성
- 캔버스 패닝 / 확대 / 축소 / 전체 보기
- 실행 취소 / 다시 실행
- 관리자 보드 JSON 내보내기 / 불러오기
- localStorage + IndexedDB 저장
- BroadcastChannel 기반 같은 브라우저 탭 실시간 동기화

## 로컬 미리보기 접속 번호

`js/config.js`에 있습니다.

- `0000` 관리자
- `101` ~ `106` 플레이어

관리자로 로그인한 뒤 메뉴 → `플레이어 접속 관리`에서 새 번호를 추가하거나 차단할 수 있습니다.

> 주의: 이 번호들은 로컬 미리보기용입니다. 실제 서비스에서는 접속 번호를 JS 파일에 두지 말고 Supabase에서 검증해야 합니다.

## 실행

Windows에서는 `start-server.bat`을 더블클릭합니다.

또는 이 폴더에서:

```bash
python -m http.server 5500
```

브라우저에서 `http://localhost:5500`을 엽니다.

## 파일 구조

```text
realtime-investigation-board/
├─ index.html
├─ README.md
├─ SUPABASE_PLAN.md
├─ start-server.bat
├─ css/
│  └─ styles.css
├─ js/
│  ├─ config.js
│  └─ app.js
└─ supabase/
   └─ schema.sql
```

## 데이터 보존 규칙

계정 목록과 보드 데이터는 별도 저장됩니다.

- 계정: `realtime-investigation-board-accounts-v2`
- 보드: `realtime-investigation-board-v2`
- 첨부 이미지/파일: IndexedDB `realtime-investigation-board-files`

따라서 플레이어를 차단해도 보드 항목은 삭제되지 않습니다.

## Supabase 연결 예정 구조

`SUPABASE_PLAN.md`와 `supabase/schema.sql` 참고.
