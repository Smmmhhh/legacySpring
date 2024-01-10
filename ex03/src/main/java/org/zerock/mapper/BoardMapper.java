package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	// Criteria 타입 
	public List<BoardVO> getListWithPaging(Criteria cretetia);
	public void insert(BoardVO boardVO);
	public void insertSelectKey(BoardVO boardVO);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO boardVO);
	
	public int getTotalCount(Criteria cretetia);
	
	
}
