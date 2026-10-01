package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http
            .cors(cors -> {}) 
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                    .requestMatchers(
                            "/api/users/register",
                            "/api/users/login",
                            "/api/users/forgot-password",
                            "/api/jobs/post",
                            "/api/jobs/all",
                            "/api/jobs/apply",
                            "/api/applications/**", 
                            "/api/jobs/search",
                            "/api/jobs/update/**",
                            "/api/jobs/delete/**",
                            "/otp/**"
                    ).permitAll()
                    .anyRequest().authenticated()
            )
            .formLogin(form -> form.disable());

        return http.build();
    }
}