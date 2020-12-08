package com.ssafy.web.service;

import java.util.List;

import com.ssafy.web.dto.Member;

public interface MemberService {
   
   public Member login(String id, String pw) throws Exception;
   public void signUp(Member member) throws Exception;
   public void modify(Member member) throws Exception;
   public void delete(String id) throws Exception;
   public List<Member> search() throws Exception;
   public String check(String id, String name) throws Exception;
}