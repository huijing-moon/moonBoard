package com.Board.controller;

import com.Board.Page;
import com.Board.service.BoardService;
import com.Board.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class HomeController extends HttpServlet {

    @Autowired
    BoardService boardService;


    @RequestMapping(value = "/")
    public String test(){
        return "index";
    }

    @RequestMapping(value = "/board/list")
    public String board(@ModelAttribute BoardVo vo, ModelMap model) throws Exception{
        List<BoardVo> list = boardService.listAll();

        model.addAttribute("list",list);
        model.addAttribute("vo",vo);

        return "board";
    }

    @RequestMapping(value = "/board/register",method ={RequestMethod.POST} )
    public String register(@ModelAttribute("vo")BoardVo vo, ModelMap model, HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("utf-8");

        model.addAttribute("vo",vo);
        boardService.create(vo);

        return "forward:/board/list";
    }

    @RequestMapping(value = "/board/insert")
    public String insert() throws Exception{
        return "insert";
    }

    @RequestMapping(value = "/board/detail/{id}")
    public String selectOne(@PathVariable String id, ModelMap model, HttpServletRequest req, HttpServletResponse resp) throws Exception{


        BoardVo vo = boardService.read(id);
        model.addAttribute("{id}",id);
        model.addAttribute("vo", vo);
        return "detail";
    }

    @RequestMapping("/board/updt/{id}")
    public String updtView(@PathVariable String id, ModelMap model, HttpServletRequest req, HttpServletResponse resp) throws Exception{

        BoardVo vo = boardService.read(id);
        model.addAttribute("{id}",id);
        model.addAttribute("vo", vo);
        return "updt";
    }

    @RequestMapping(value = "/board/save", method = {RequestMethod.POST})
    public String save (@ModelAttribute("vo")BoardVo vo, ModelMap model, HttpServletRequest req, HttpServletResponse resp, BindingResult bindingResult) throws Exception {

        req.setCharacterEncoding("utf-8");
        model.addAttribute("vo",vo);
        boardService.update(vo);

        return "forward:/board/list";
    }

    @RequestMapping(value = "/board/delete/{id}" )
    public String delete(@PathVariable String id,@ModelAttribute("vo") BoardVo vo, ModelMap model, HttpServletRequest req, HttpServletResponse resp) throws Exception{

        model.addAttribute("vo", vo);
        model.addAttribute("id", id);
        boardService.delete(vo);

        return "forward:/board/list";
    }

    @RequestMapping(value = "/board/listPage", method = RequestMethod.GET)
    public String getListPage(@RequestParam("num") int num, Model model,
                              @RequestParam(value = "searchType", required = false, defaultValue = "title")String searchType,
                              @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception{

        Page page = new Page();
        page.setNum(num);
        page.setCount(boardService.count(searchType, keyword));

        //검색 타입과 검색어
//        page.setSearchTypeKey(searchType,keyword);
        page.setKeyword(keyword);
        page.setSearchType(searchType);

        List<BoardVo> list = boardService.listPage(page.getDisplayPost(),page.getPostNum(), searchType, keyword);

        model.addAttribute("list",list);
//
        model.addAttribute("page",page);
        model.addAttribute("select", num);
        return "listPage";
    }

}
