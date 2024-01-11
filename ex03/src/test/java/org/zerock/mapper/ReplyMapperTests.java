package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = { 100L, 99L, 98L, 97L, 96L, };

	@Autowired
	private ReplyMapper replyMapper;
	
//	@Test
//	public void testMapper() {
//		
//		log.info(replyMapper);
//		
//	}
	
//	@Test
//	public void testCreate() {
//		
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			ReplyVO vo = new ReplyVO();
//			
//			//게시물의 번호
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트 " + i);
//			vo.setReplyer("replyer" + i);
//			
//			replyMapper.insert(vo);
//		});
//		
//	}
	
//	@Test 
//	public void read() {
//		
//		Long targetRno = 5L;
//		ReplyVO vo = replyMapper.read(targetRno);
//		
//		log.info(vo);
//		
//	}
	
//	@Test
//	public void delete() {	
//		
//		Long targetRno = 10L;
//		replyMapper.delete(targetRno);
//
//	}
	
//	@Test
//	public void update() {
//		
//		Long targetRno = 2L;
//		
//		ReplyVO vo = replyMapper.read(targetRno);
//		
//		vo.setReply("update reply");
//		
//		int count = replyMapper.update(vo);
//		
//		log.info("Update Count : " + count);
//		
//	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> list = replyMapper.getListWithPaging(cri, bnoArr[3]);
		
		list.forEach(reply -> log.info(reply));
		
		
	}
	
	
}
