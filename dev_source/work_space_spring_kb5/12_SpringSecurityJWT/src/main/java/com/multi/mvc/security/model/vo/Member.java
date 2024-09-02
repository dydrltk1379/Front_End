package com.multi.mvc.security.model.vo;

import java.sql.Date;
import java.util.Collection;
import java.util.List;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Member implements UserDetails {
    private long mno;            // PK
    private String id;            // username
    private String password;    // password
    private String name;
    private int age;
    private Date enrollDate;
    private boolean enabled;        // 활성화 여부
    private String token;

    // 복수개의 권한을 관리
    // 문자열data("ROLE_USER", "ROLE_ADMIN")를 처리할 수 있는 GrantedAuthority의 하위클래스
    private List<GrantedAuthority> authorities; // authorities

    /**
     * Collection - List/Set
     * <p>
     * Collection<? extends GrantedAuthority>
     * - <GrantedAuthority를 상속하는 ?> -> 자식타입(상한선)
     * - <? super Integer> -> Integer 부모타입 (하한선)
     * Collection<GrantedAuthority>
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getUsername() {
        return id;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

}
