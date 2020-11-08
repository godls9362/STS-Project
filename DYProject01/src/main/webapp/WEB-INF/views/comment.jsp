
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>



<script>
	var Bno = '${vo.no}'; //게시글 번호
	var lid='${login.id}';// 로그인 아이디 

	$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
		var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		commentInsert(insertData); //Insert 함수호출(아래)

	});
	//댓글 목록 
	function commentList() {
		$.ajax({
					url : 'BCAllist',
					type : 'get',
					data : {
						'Bno' : Bno
					},
					dataType : 'json',
					success : function(temp) {
						if (temp) {
							var a = '';
							$(".commentList").html(a);
							for (var i = 0; i < temp.length; i++) {
								a += '<div  id="mytabless" class="commentArea" style="border-bottom:1px solid darkgray;margin-top:10px; margin-left:160px; margin-bottom: 15px;">';
								a += '<div  id="rel" class="commentInfo'+temp[i].cno+'">'
										+ '댓글번호 : '
										+ temp[i].cno
										+ ' / 작성자 : ' + temp[i].cwriter + ' / 작성일자 : ' +temp[i].cregtime ;
								a += '<div  id="rel" class="commentContent'+temp[i].cno+'"> <p> 내용 : '
										+ temp[i].ccontent + '</p>';
								a += '<button id="rel5" data-rid='+temp[i].cwriter + ' data-reno='
										+ temp[i].cno +  '> 삭제 </button> </div>';
								a += '</div></div>';
							}
							$(".commentList").append(a);
						} 
					},
					error : function() {
						alert("ㅠ");
					}
				});
		return false;
	}
	
	$(document).on("click", "#rel5", function() {
		var aa = $(this).data("reno");
		var bb=$(this).data("rid");
		if(bb==lid){
		commentDelete(aa);
		}
		else{
			alert(bb+"님만 삭제 가능합니다.");
			
		}
	})

	//댓글 등록
	function commentInsert(insertData) {
		$.ajax({
			url : 'insertBC',
			type : 'post',
			data : insertData,
			success : function(data) {
				if (data == 1) {
					alert("댓글성공");
					commentList(); //댓글 작성 후 댓글 목록 reload
					$('[name=Ccontent]').val('');
				}
			}
		});
	}

	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	

	//댓글 삭제 
	function commentDelete(aa) {
		$.ajax({
			url : 'deleteBC',
			data : {
				'aa' : aa
			},
			dataType : 'json',
			type : 'get',
			success : function(data) {
				if (data == 1)
					alert("삭제되었습니다.");
					commentList(Bno); //댓글 삭제후 목록 출력 
			}
		});
	}

	$(document).ready(function() {
		commentList(); //페이지 로딩시 댓글 목록 출력 
	});
</script>