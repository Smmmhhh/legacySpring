package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;
	
//	@Test
//	public void testGetList() {
//		boardMapper.getList().forEach(board -> {
//			log.info(board);
//		});
//	}
//	
//	@Test
//	public void testInsert() {
//		
//		BoardVO boardVO = new BoardVO();
//		boardVO.setTitle("새로 작성하는 글");
//		boardVO.setContent("새로 작성하는 내용");
//		boardVO.setWriter("newbie");
//		
//		boardMapper.insert(boardVO);
//		
//		log.info(boardVO);
//	}
//	
//	@Test
//	public void testInsertSelectKey() {
//		BoardVO boardVO = new BoardVO();
//		boardVO.setTitle("새로 작성하는 글 SelectKey");
//		boardVO.setContent("새로 작성하는 내용 SelectKey");
//		boardVO.setWriter("newbie");
//		
//		boardMapper.insertSelectKey(boardVO);
//		log.info(boardVO);
//	}
	
//	@Test
//	public void testRead() {
//		BoardVO boardVO = boardMapper.read(5L);
//		log.info(boardVO);
//	}
	
//	@Test
//	public void testDelete() {
//		log.info(boardMapper.delete(3L));
//	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO boardVO = new BoardVO();
//		boardVO.setBno(5L);
//		boardVO.setTitle("수정된 제목");
//		boardVO.setContent("수정된 내용");
//		boardVO.setWriter("user00");
//		
//		int count = boardMapper.update(boardVO);
//		log.info("UPDATE COUNT : " + count);
//	}
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria(4, 10);
//		List<BoardVO> li = boardMapper.getListWithPaging(cri);
//		li.forEach(board -> log.info(board));
//		
//	}
	
	@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("새로");
		cri.setType("");
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
		
	}
	
	
	
	
	
  	
}
