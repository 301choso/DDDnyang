package com.dddn.DDDnyang.image;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dddn.DDDnyang.board.BoardVO;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDao imageDao;

	@Override
	public void insertImage(ImageVO imageVO) {
		imageDao.insertImage(imageVO);
	}

	@Override
	public List<ImageVO> getImageInfo(ImageVO imageVO) {
		return imageDao.getImageInfo(imageVO);
	}
	
	
}
