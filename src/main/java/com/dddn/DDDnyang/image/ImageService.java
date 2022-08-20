package com.dddn.DDDnyang.image;

import java.util.List;

import com.dddn.DDDnyang.board.BoardVO;

public interface ImageService {

	public void insertImage(ImageVO imageVO);

	public List<ImageVO> getImageInfo(ImageVO imageVO);

}
