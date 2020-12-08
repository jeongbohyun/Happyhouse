package com.ssafy.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.ssafy.web.dto.Favorite;
import com.ssafy.web.dto.Member;
import com.ssafy.web.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{
   
   @Autowired
   MemberRepository repo;
   
   @Override
   public Member login(String id, String pw) throws Exception {
      Member member = repo.login(id, pw);
      
      if(member == null) return null;
      return member;
   }

   @Override
   public String check(String id, String name) throws Exception {
      String password = repo.check(id, name);
      if(password==null) return null;
      return password;
   }
   
   @Override
   public void signUp(Member member) throws Exception {
      repo.signUp(member);
   }

   @Override
   public void modify(Member member) throws Exception {
      repo.modify(member);
   }

   @Override
   public void delete(String id) throws Exception {
      repo.delete(id);
   }

   @Override
   public List<Member> search() throws Exception {
      
      return repo.search();
   }



   

}