package com.multi.ex02.user_exception;

// LoginError의 유형과 원인을 알려줄 수 있는 enum문
public enum LoginErrorCode {
    WRONG_ID(501, "아이디가 잘 못 되었습니다."),
    WRONG_PW(501, "패스워드가 잘 못 되었습니다."),
    NO_INPUT_ID(601, "아이디가 입력되지 않았습니다."),
    NO_INPUT_PW(601, "패스워드가 입력되지 않았습니다."),
    DB_ERROR(701, "DB에서 조회할 수  없습니다.");

    private int CODE;
    private final String cause;

    LoginErrorCode(int CODE, String cause) {
        this.CODE = CODE;
        this.cause = cause;
    }

    public int getCode() {
        return CODE;
    }

    public String getCause() {
        return cause;
    }

}
