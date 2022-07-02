package com.dddn.DDDnyang.image;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dddn.DDDnyang.board.BoardVO;

@Repository("imageDao")
public class ImageDao {

	@Autowired
	private SqlSession sqlSession;

	public void insertImage(ImageVO imageVO) {
		sqlSession.insert("image.insertImage", imageVO);
	}
	
	
}
