package com.ssafy.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
   
import com.ssafy.web.dto.Member;
import com.ssafy.web.service.MemberService;

@Controller
@RequestMapping("/mem")
public class MemberController {
   @Autowired
   MemberService ser;
  
   @RequestMapping("/login")
   public ModelAndView login(HttpSession session, @RequestParam("inputId") String userid, @RequestParam("inputPassword") String userpwd,ModelAndView mv) {
     System.out.println(userid+" "+userpwd);
      try {
         Member member = ser.login(userid, userpwd);
         if (member != null) {
            
            session.setAttribute("member", member);
            mv.setViewName("redirect:/");
         } else {
            mv.addObject("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
            mv.setViewName("/error/error");
            
         }
         
      } catch (Exception e) {
         e.printStackTrace();
         mv.addObject("msg", "로그인 중 문제가 발생했습니다.");
         mv.setViewName("/error/error");        
      }     
      return mv;
   }
   
   @RequestMapping("/findpw")
   public ModelAndView findpw(HttpSession session,ModelAndView mv) {
      mv.setViewName("/user/findpw");
      return mv;
   }
   
   
   @RequestMapping(value="/findpwd",method = RequestMethod.POST)
   public ModelAndView findpass(@RequestParam("userId") String userid,@RequestParam("userName") String username,
                        ModelAndView mv, HttpSession session)  {
      try {
            String password = ser.check(userid, username);
            if (password != null) {
               System.out.println(password);
               
               mv.setViewName("/user/result");
               mv.addObject("pw",password);
               
            } else {
               mv.addObject("msg", "아이디 또는 이름 확인 후 로그인해 주세요.");
               mv.setViewName("/error/error");
               mv.addObject("pw",password);

            }
            
         } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "비밀번호찾기 중 문제가 발생했습니다.");
            mv.setViewName("/error/error");        
         }     
      return mv;
   }
   
   
   
   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String login() {
      return "user/signup";
   }
   
   @RequestMapping(value = "/join", method = RequestMethod.POST)
   public ModelAndView signup(@RequestParam("signupId") String userid, @RequestParam("signupPassword") String userpwd,
                        @RequestParam("signupName") String username, @RequestParam("hakgun") int hakgun,@RequestParam("cafe") int cafe,
                        @RequestParam("hospital") int hospital, @RequestParam("theater") int theater, @RequestParam("depart") int depart,
                     @RequestParam("mac") int mac, @RequestParam("subway") int subway, 
                        ModelAndView mv, HttpSession session)  {
      try {
         ser.signUp(new Member(userid, username, userpwd, "0", hakgun, cafe, hospital, theater,depart,mac,subway));
         mv.addObject("msg","잘 들어갔어요");
         mv.setViewName("redirect:/");
      } catch (Exception e) {
         e.printStackTrace();
         mv.addObject("msg","회원가입 중 문제가 발생했습니다.");
         mv.setViewName("/error/error");
      }
      return mv;
   }
   

   
   @RequestMapping("/logout")
   public ModelAndView logout(HttpSession session,ModelAndView mv) {
      String res = new String();
      session.invalidate();
      res = "로그아웃성공";
      mv.addObject("msg",res);
      mv.setViewName("redirect:/");
      return mv;
   }
   

   
   @RequestMapping("/user-info")
   public ModelAndView user_info(HttpSession session,ModelAndView mv) {
      mv.setViewName("/user/user-info");
      return mv;
   }
   
   @RequestMapping(value = "/userdel", method = RequestMethod.GET)
   public ModelAndView userdel(@RequestParam("userid") String userid, ModelAndView mv, HttpSession session)  {

      try {
         ser.delete(userid);
         session.invalidate();
         mv.setViewName("redirect:/");
      } catch (Exception e) {
         e.printStackTrace();
         mv.addObject("msg","회원 탈퇴중 문제가 발생했습니다.");
         mv.setViewName("/error/error");
      }

      return mv;
   }
   
   @RequestMapping(value = "/user-info-modi", method = RequestMethod.GET)
   public ModelAndView user_info_MODI(HttpSession session,ModelAndView mv) {
      mv.setViewName("/user/user-info-modi");
      return mv;
   }
   
   @RequestMapping("/user-modi")
   public ModelAndView userModify(@RequestParam("userId") String userid,@RequestParam("userPw") String userpwd,@RequestParam("userName") String username,
          @RequestParam("hakgun") int hakgun,@RequestParam("cafe") int cafe,
           @RequestParam("hospital") int hospital, @RequestParam("theater") int theater, @RequestParam("depart") int depart,
            @RequestParam("mac") int mac, @RequestParam("subway") int subway,
         ModelAndView mv, HttpSession session)  {
      try {
         ser.modify(new Member(userid,username,userpwd,null, hakgun, cafe, hospital, theater,depart,mac,subway));
         Member member = ser.login(userid, userpwd);
         session.setAttribute("member", member);
         mv.setViewName("redirect:/");
      } catch (Exception e) {
         e.printStackTrace();
         mv.addObject("msg","수정 중 문제가 발생했습니다.");
         mv.setViewName("/error/error");
      }
      return mv;
   }
   
   @RequestMapping(value = "/detail", method = RequestMethod.GET)
   public ModelAndView detail(HttpSession session,ModelAndView mv) {
      mv.setViewName("/user/detail");
      return mv;
   }
}