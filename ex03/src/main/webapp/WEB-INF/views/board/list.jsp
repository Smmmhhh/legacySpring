<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board List Page
				<button id="regBtn" type="button" class="btn btn-xs pull-right">
					Register New Board</button> 
			</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="boader">
						<tr>
							<td><c:out value="${boader.bno}" /></td>
							
							<td>
								<a class='move' href='<c:out value="${boader.bno }"/>'>
								<c:out value="${boader.title }" /></a>
							</td>
							
							<td><c:out value="${boader.writer }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${boader.regdate }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${boader.updateDate }"/></td>
						</tr>	
					</c:forEach>	
				</table>
				
				<!-- Search Start -->
				<div class='row'>
					<div class="col-lg-12">
						
						<form id="searchForm" action="/board/list" method="get">
							<select name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
								<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 or 내용</option>
								<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 or 작성자</option>
								<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}"/>>제옥 or 내용 or 작성자</option>
							</select>
							<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'/>
							<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'/>
							<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'/>
							<button class="btn btn-default">Search</button>
						</form>
					</div>
				</div>
				
				<!-- Pagination Start -->
				<div class='pull-right'>
					<ul class='pagination'>
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage - 1 }">Previous</a>
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' } ">
								<a href="${num }">${num }</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next">
								<a href="${pageMaker.endPage + 1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
				</form>
				<!-- end Pagination -->
				
			<!-- Modal 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-dafault" 
							data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
				

			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
		
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>

<!-- <script type="text/javascript">

$(document).ready(function() {
	var result = '<c:out value="${result}"/>';
});

</script> -->

<!-- Modal jQuery -->
<script type="text/javascript">

	/* Query 문법을 사용하여, 문서의 DOM이 완전히 로드되고 준비되었을 때
	실행될 함수를 정의합니다. 
	즉, 웹 페이지가 완전히 로드되고 나면 이 함수 내의 코드가 실행됩니다. */
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';		// 서버측의 result라는 이름의 객체를 가져옴
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			if(result === '' || history.state) {
				return;
			}
			
			if(parseInt(result) > 0) {
				/*이 줄은 HTML 문서 내에 클래스 이름이 modal-body인 요소를 찾고, 
				그 내용을 "게시글 [result] 번이 등록되었습니다."라는 메시지로 바꿉니다. */
				$(".modal-body").html("게시글 " + parseInt(result) +
						" 번이 등록되었습니다."); 
			}
			
			$("#myModal").modal("show");
		}
		
		// 게시물 등록하기 버튼을 눌렀을 때 페이지 이동
		$("#regBtn").on("click", function(){
			self.location = "/board/register";
		});
		
		// 페이징 처리 
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('페이지 click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e) {
			
			e.preventDefault();
			// actionForm 태그에 input 태그를 추가 후 form을 제출할 때 input hidden type이 함께 제출된다. 
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			// board/list -> board/get 으로 변경
			actionForm.attr("action", "/board/get");
			actionForm.submit();
			
		});
		
		// 검색처리 
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
			
			if(!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
			
		});
		
		
	});
	
</script>