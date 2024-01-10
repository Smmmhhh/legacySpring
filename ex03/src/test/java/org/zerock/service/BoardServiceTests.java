package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class BoardServiceTests {
	@Autowired
	private BoardService service;
	
//	@Test
//	public void testExist() {
//		log.info("service = " + service);
//		assertNotNull(service);
//	}
	
//	@Test
//	public void testRegister() {
//		
//		BoardVO boardVO = new BoardVO();
//		
//		boardVO.setTitle("새로 작성하는 글");
//		boardVO.setContent("새로 작성하는 내용");
//		boardVO.setWriter("Newbie");
//		
//		service.register(boardVO);
//		
//		log.info("생성된 게시물의 번호 : " + boardVO.getBno());
//		
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> {
//			log.info(board);
//		});
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(1L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : " + service.remove(2L));
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		BoardVO boardVO = service.get(1L);
//		
//		if(boardVO == null) return;
//		
//		boardVO.setTitle("제목을 수정합니다.");
//		log.info("Modify Result : " + service.modify(boardVO));
//		
//	}
	
	@Test
	public void testGetList() {
		
		Criteria cri = new Criteria(2, 10);
		service.getList(cri).forEach(board -> log.info(board));
		
	}
	
}
