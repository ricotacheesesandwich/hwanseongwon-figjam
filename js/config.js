window.INVESTIGATION_BOARD_CONFIG = {
  /*
    local-preview : 서버 없이 브라우저에서 기능 확인
    supabase      : Supabase Edge Function + Storage + Realtime 사용
  */
  mode: "supabase",
  boardId: "main-investigation-board",

  localPreview: {
    // 비밀번호는 코드에 미리 넣지 않습니다.
    // 첫 실행 시 입력한 첫 비밀번호가 로컬 관리자 비밀번호가 됩니다.
    allowFirstRunAdminSetup: true,
  },

  supabase: {
    enabled: true,
    url: "https://uaetlweizsdeoqaerrlt.supabase.co",
    publishableKey: "sb_publishable_6RUa1i1Btv0AeosyI-k0jg_lR9IIum3",
    edgeFunctionName: "clever-api",
    storageBucket: "investigation-board-files",
    realtimeTopicPrefix: "investigation-board",
  },

  // 비밀번호는 사용자가 직접 지정합니다. 여기에는 이름/권한만 둡니다.
  initialAccounts: [
    {
      id: "player-01",
      displayName: "우혜인",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-02",
      displayName: "도하나",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-03",
      displayName: "야차",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-04",
      displayName: "연호연",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-05",
      displayName: "이건하",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-06",
      displayName: "유수담",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-07",
      displayName: "유애호",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-08",
      displayName: "사공이진",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-09",
      displayName: "권신예",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-10",
      displayName: "하설유",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-11",
      displayName: "하도야",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-12",
      displayName: "여 명",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-13",
      displayName: "무묘진",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-14",
      displayName: "박재안",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-15",
      displayName: "오현주",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-16",
      displayName: "염원",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-17",
      displayName: "신 결",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-18",
      displayName: "이루한",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-19",
      displayName: "제하연",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-20",
      displayName: "백우양",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-21",
      displayName: "진 백",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-22",
      displayName: "박무진",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-23",
      displayName: "강도겸",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-24",
      displayName: "설하린",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-25",
      displayName: "설하람",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-26",
      displayName: "백환",
      role: "participant",
      blocked: false,
    },
    {
      id: "player-27",
      displayName: "가득순",
      role: "participant",
      blocked: false,
    },
    { id: "admin", displayName: "관리자", role: "admin", blocked: false },
  ],
};
