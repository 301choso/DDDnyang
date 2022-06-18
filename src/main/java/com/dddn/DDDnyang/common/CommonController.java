package com.dddn.DDDnyang.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/common")
@Controller
public class CommonController {

	/**
     * SUMMER SNOW 에디터
     *
     * @return
	 * @throws Exception 
     */
    @RequestMapping(value = "/editor.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView editor() throws Exception {
        try {
            ModelAndView mav = new ModelAndView();
            mav.setViewName("common/summernote/editor");
            return mav;
        } catch (Exception e) {
            throw new Exception("잘못된 호출입니다.");
        }
    }
}
