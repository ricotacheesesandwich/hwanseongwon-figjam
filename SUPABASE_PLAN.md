# Supabase 연결 계획

현재 버전은 UI와 데이터 구조를 먼저 완성한 로컬 미리보기입니다. 실제 여러 사용자 / 여러 PC 실시간 운영 시 아래처럼 교체합니다.

## 1. 계정

현재:
- `localStorage`의 계정 목록
- `accessCode`, `displayName`, `role`, `blocked`

Supabase:
- `investigation_accounts`
- 접속 번호는 평문으로 프론트 코드에 넣지 않음
- DB에서 해시 검증
- `blocked = true`가 되는 즉시 Realtime으로 클라이언트에 전달하여 세션 종료

중요: 실제 운영에서는 단순히 브라우저가 `role=admin`이라고 보내는 값만 믿으면 안 됩니다. 관리자 권한 검증은 Supabase Auth 또는 서버측 RPC / Edge Function과 RLS로 강제해야 합니다.

## 2. 보드

현재:
- `localStorage`
- `items[]`
- `connections[]`

Supabase:
- `investigation_board_items`
- `investigation_board_connections`
- INSERT / UPDATE / DELETE 이벤트 Realtime 구독

## 3. 사진과 첨부파일

현재:
- IndexedDB blob

Supabase:
- Storage bucket `investigation-board-files`
- item에는 Storage object path만 저장

## 4. 차단 시 데이터 보존

차단은 `investigation_accounts.blocked`만 변경합니다.

절대 다음 데이터를 자동 삭제하지 않습니다.
- 조사 자료
- 포스트잇
- 기호 스티커
- 사진 스티커
- 붉은 연결선

따라서 차단된 플레이어의 이전 조사 흔적은 사건 보드에 남습니다.
