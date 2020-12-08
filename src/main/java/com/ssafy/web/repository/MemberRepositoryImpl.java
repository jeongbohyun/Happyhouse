package com.ssafy.web.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.ssafy.web.dto.Favorite;
import com.ssafy.web.dto.Member;

@Repository
public class MemberRepositoryImpl implements MemberRepository{
   
   @Autowired
   SqlSession session;
   
   @Override
   public Member login(String id, String pw) throws Exception {
      Map<String, String> map = new HashMap<String, String>();
      map.put("id", id);
      map.put("pw", pw);
      Member member = session.selectOne("ssafy.member.login", map);
      System.out.println(member);
      return member;
   }
   
   @Override
   public String check(String id, String name) throws Exception {
      Map<String, String> map = new HashMap<String, String>();
      map.put("id", id);
      map.put("name", name);
      String password = session.selectOne("ssafy.member.check", map);
      System.out.println(password);
      return password;
   }

   @Override
   public void signUp(Member member) throws Exception {   
      if(member.getCafe()==0&member.getDepart()==0&member.getSubway()==0&member.getHakgun()==0
            &member.getHospital()==0&member.getMac()==0&member.getTheater()==0) {
         member.setCafe(1);
         member.setDepart(1);
         member.setHakgun(1);
         member.setHospital(1);
         member.setMac(1);
         member.setSubway(1);
         member.setTheater(1);
      }
      session.insert("ssafy.member.signup",member);
   }

   @Override
   public void modify(Member member) throws Exception {
      if(member.getCafe()==0&member.getDepart()==0&member.getSubway()==0&member.getHakgun()==0
            &member.getHospital()==0&member.getMac()==0&member.getTheater()==0) {
         member.setCafe(1);
         member.setDepart(1);
         member.setHakgun(1);
         member.setHospital(1);
         member.setMac(1);
         member.setSubway(1);
         member.setTheater(1);
      }
      session.update("ssafy.member.modify",member);
   }

   @Override
   public void delete(String id) throws Exception {
      session.delete("ssafy.member.delete", id);
   }

   @Override
   public List<Member> search() throws Exception {      
      return session.selectList("ssafy.member.search");
   }




}