<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/mybook_review.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/modal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/source.css">
<script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- ------nav------ -->
		<div id="nav" class="clearfix">
			<c:choose>
				<c:when test="${result eq 'sameUser'}">
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}">내 서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<!--세션 아이디와 사이트아이디 같을때-->
						<li role="presentation"><a href="${pageContext.request.contextPath}/analyze">통계</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<!-- 세션아이디랑 다를때는 사이트주소의 아이디와 같은 유저의 데이터들 불러오기-->
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}">남 서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- ------nav------ -->
		<!--content-->
		<div class="container">
			<div class="row">
				<!-- col-xs-8 -->
				<div id="content" class="col-xs-8">
					<!--기록하기 박스-->
					<!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->
					<c:if test="${result eq 'sameUser'}">
						<div id="writebox" class="jumbotron">
							<h1>서평 기록하기</h1>
							<p>'${authUser.nickname}'님, 오늘은 어떤 책을 읽으셨나요?</p>
							<p>
								<a class="btn btn-primary btn-md" href="${pageContext.request.contextPath}/review_write" role="button">기록하기</a>
							</p>
						</div>
					</c:if>
					<!-- list -->
					<div id="list">
						<ul>
							<li><a><span id="latest-order">최신순</span></a></li>
							<li><a><span id="best-order">인기순</span></a></li>
						</ul>
						<span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
						<div id="category" class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								카테고리 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="">즐거운</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="">우울한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="">화난</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="">감성적인</a></li>
							</ul>
						</div>
					</div>
					<c:if test="${result eq 'sameUser'}">
						<div id="rvlist"></div>
					</c:if>
					
					<!-- 서평 리스트 -->
					<!-- 
               
	               <c:forEach items="${mbList }" var="vo">
	                  <div id="reviews">
	                     <div id="reviews-header">
	                        <div class="left">
	                           <p>
	                              <a href="${pageContext.request.contextPath}/bookdetail?bookNo=${vo.bookNo}">${vo.bookTitle }</a>
	                           </p>
	                        </div>                                                
	                        <div class="right">
	                           <a>수정</a> <a>삭제</a>
	                        </div>                      
	                     </div>
	                     	
	                     <div id="reviews-content">
	                        <p>${vo.reviewContent }</p>
	                     </div>
	                     <div id="reviews-footer">
	                        <div class="left">
	                           <span id="heart" data-reviewno="${vo.reviewNo }" class="like glyphicon glyphicon-heart-empty" aria-hidden="true"></span> <span>${vo.likecnt }</span> <span>${vo.reviewDate }</span>
	                        </div>
	                        <div class="right">
	                           <div class="dropup">
	                              <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 더보기 <span class="caret"></span>
	                              </a>
	                              <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
	                                 <li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li>
	                                 <li role="presentation" class="divider"></li>
	                                 <li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
	                                 <li role="presentation" class="divider"></li>
	                                 <li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" href="${pageContext.request.contextPath}/imgpreview">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
	                                 </a></li>
	                              </ul>
	                           </div>
	                        </div>
	                     </div>
	                  </div>
	               </c:forEach> -->
					<!-- 서평리스트 -->
				</div>
				<!-- //col-xs-8 -->
				<!-- col-xs-4:프로필 -->
				<div id="aside" class="col-xs-4">
					<div id="profile-box" class="panel panel-default">
						<div class="panel-heading">
							<c:choose>
								<c:when test="${result eq 'sameUser'}">
									<h3 id="profile-title" class="panel-title">내 서재</h3>
								</c:when>
								<c:otherwise>
									<h3 id="profile-title" class="panel-title">${result}님의서재</h3>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="panel-body">
							<div id="profile">
								<img id="profile-image" src="${pageContext.request.contextPath}/asset/img/profile.png">
							</div>
							<c:choose>
								<c:when test="${result eq 'sameUser'}">
									<p id="username">${authUser.nickname}</p>
								</c:when>
								<c:otherwise>
									<p id="username">${result}</p>
								</c:otherwise>
							</c:choose>
							<p id="level">Lv.0</p>
							<div id="info">
								<a href="${pageContext.request.contextPath}/user/user_modify">회원정보수정</a> <a>로그아웃</a>
							</div>
						</div>
					</div>
				</div>
				<!-- //col-xs-4 -->
			</div>
		</div>
		<!--content-->
		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- modal창 -->
		<c:import url="/WEB-INF/views/include/modal.jsp"></c:import>
	</div>
</body>
<script type="text/javascript">
	
	//리스트(로딩되기전에 요청)
	$(document).ready(function() {
		
		console.log("리스트요청");
		
		//색깔변화
		$('#latest-order').attr('class','txt-b');
    	$('#best-order').attr('class','');
    	
		//리스트그리기
		fetchList();
	
	});
	
	// 최신순 인기순 버튼 클릭
	// 최신순
	$('#latest-order').on('click', function() {
		console.log('최신순');
		
		//색깔변화
		$('#latest-order').attr('class','txt-b');
    	$('#best-order').attr('class','');
		
		//초기화 후 그리기
		$("#rvlist").empty();
		fetchList();
	});

	// 인기순
	$('#best-order').on('click', function() {
		console.log('인기순');
		
		//색깔변화
		$('#best-order').attr('class','txt-b');
    	$('#latest-order').attr('class','');
		
		//초기화 후 그리기
		$("#rvlist").empty();
		popularList();
	});
	
	
	//리스트 그리기(최신순)
	function fetchList() {

		$.ajax({
			url : "${pageContext.request.contextPath }/${nickname}/list?sort=latest", ///<<<파라미터로 인기순 최신순 나눠보기
			type : "get",

			dataType : "json",
			success : function(mbList) {
				/*성공시 처리해야될 코드 작성*/
				console.log(mbList);

				//객체 리스트 돌리기(화면 출력)
				for (var i = 0; i < mbList.length; i++) {
					//그리기
					render(mbList[i], "down");
					
					//중복체크 후 
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	};
	
	
	//리스트 그리기(인기순)
	function popularList() {

		$.ajax({
			url : "${pageContext.request.contextPath }/${nickname}/list?sort=popular",
			type : "get",

			dataType : "json",
			success : function(popularlist) {
				/*성공시 처리해야될 코드 작성*/
				console.log(popularlist);

				//객체 리스트 돌리기(화면 출력)
				for (var i = 0; i < popularlist.length; i++) {
					//그리기
					render(popularlist[i], "down");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	};

	//특정 서평 그리기
	function print(no) {

		$.ajax({
			url : "${pageContext.request.contextPath }/${nickname}/list?sort=latest", ///<<<파라미터로 인기순 최신순 나눠보기
			type : "get",

			dataType : "json",
			success : function(mbList) {

				//객체 리스트 돌리기(화면 출력)
				render(mbList[no], "down");
			
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	};
	
	//좋아요 버튼을 클릭했을때(이벤트)
	$("#rvlist").on("click", ".like", function() {
		
		//데이터수집
		var $this = $(this);
		
		var no = $this.data("reviewno");
		//var likecnt = parseInt($(this).next().data("likecnt"));
		var likecnt = $this.next().data("likecnt");
		
		//출력(리뷰넘버찍어보기), json 으로 보내주기
		console.log("서평넘버 : "+no+", 좋아요 수 : "+likecnt);
		
		var clickReviewVo = {
			reviewNo : no
		};
		
		//요청 : json 방식
		$.ajax({
			//url로 요청할게!    
			url : "${pageContext.request.contextPath }/like",
			type : "post",
			contentType : "application/json", //보낼때 json으로 보낼게
			data : JSON.stringify(clickReviewVo),
			//주소뒤에 갈 데이터 전송방식, //자바 스크립트 객체를 json형식으로 변경
			dataType : "json", //json> javascript
			
			success : function(likeok) {
				
				//포함되어있으면 true      
			    let isExist = document.getElementById('latest-order').classList.contains('txt-b');  
			    console.log(isExist);				
			    console.log(no);
			    
			   /* 
			  //좋아요인경우
			   	if (likeok == 0) {	
			   		
				    console.log("좋아요");
					
				  	//하트모양변경
			      	$this.attr('class', 'like glyphicon glyphicon-heart');
				  	
				    //카운트 +1
				    $this.next().html(likecnt+1);	
				    
				  
				  	
			   } else {
				   
			       console.log("좋아요취소");
			      
			       $this.attr('class','like glyphicon glyphicon-heart-empty');
			       
			       $this.next().html(likecnt);
			   }
			   */
			    
			    
			   	//좋아요인경우
			   	if (likeok == 0) {	
			   		
				    console.log("좋아요");
								  
				  	if(isExist == true){
				  		
				  		//$("r"+no).remove();
				  		//print(no);
				  		
				  		
				  		//초기화 후 그리기
						$("#rvlist").empty();
						fetchList();
				  		
				  	}else{
				  		//초기화 후 그리기
						$("#rvlist").empty();
						popularList();
				  	}
				  	
				  	//하트모양변경
			      	$this.attr('class', 'like glyphicon glyphicon-heart');
				  	
				    //카운트 +1
				    //$this.next().html(likecnt+1);				  
					
			   } else {
				   
			       console.log("좋아요취소");
			      
			       if(isExist == true){
				  		//초기화 후 그리기
						$("#rvlist").empty();
						fetchList();	
				  	}else{
				  		//초기화 후 그리기
						$("#rvlist").empty();
						popularList();
				  	}
			       
			       $this.attr('class','like glyphicon glyphicon-heart-empty');
			   }
			     
			    

			},
			//로그인하지 않은경우(모달창띄워주기)
			error : function(XHR, status, error) {
			   console.error(status + " : " + error);
			}
		});

	});

	 
	function render(mybookVo, updown) {
		
		var str = '';
		str += '	<div class="reviews" id=r'+mybookVo.reviewNo+'> ';
		str += '		<div class="reviews-header"> ';
		str += ' 		<div class="left"> ';
		str += ' 			<p><a href="${pageContext.request.contextPath}/bookdetail?bookNo='+ mybookVo.bookNo + '">' + mybookVo.bookTitle + '</a></p> ';
		str += ' 		</div> ';
		str += ' 		<div class="right"> ';
		str += ' 			<a>수정</a> <a>삭제</a> ';
		str += ' 		</div> ';
		str += ' 	</div> ';
		str += ' 	<div class="reviews-content"> ';
		str += ' 		<p>' + mybookVo.reviewContent + '</p> ';
		str += ' 		<span class="label label-default">'+mybookVo.emoName+'</span> ';
		str += ' 	</div> ';
		str += ' 	<div class="reviews-footer"> ';
		str += ' 		<div class="left likecontrol"> ';
		if(mybookVo.likecheck == 0){
	         str += ' <span id="heart" data-reviewno="'+mybookVo.reviewNo+'" class="like glyphicon glyphicon-heart-empty" aria-hidden="true"></span> <span class="likecnt" data-likecnt="'+mybookVo.likecnt+'">'+ mybookVo.likecnt+ '</span> <span>'+ mybookVo.reviewDate+ '</span> ';
	    }else{
	         str += ' <span id="heart" data-reviewno="'+mybookVo.reviewNo+'" class="like glyphicon glyphicon-heart" aria-hidden="true"></span> <span class="likecnt" data-likecnt="'+mybookVo.likecnt+'">'+ mybookVo.likecnt+ '</span> <span>'+ mybookVo.reviewDate+ '</span> ';
	    }		
		str += ' 		</div> ';
		str += ' 		<div class="right"> ';
		str += ' 			<div class="dropup"> ';
		str += ' 				<a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 더보기 <span class="caret"></span></a> ';
		str += ' 				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2"> ';
		str += ' 					<li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li> ';
		str += ' 					<li role="presentation" class="divider"></li> ';
		str += ' 					<li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li> ';
		str += ' 					<li role="presentation" class="divider"></li> ';
		str += ' 					<li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" href="${pageContext.request.contextPath}/imgpreview">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span></a></li> ';
		str += ' 				</ul> ';
		str += ' 			</div> ';
		str += ' 		</div> ';
		str += ' 	</div> ';
		str += ' </div> ';
		
		if (updown == 'down') {
			$("#rvlist").append(str);
		} else if (updown == 'up') {
			$("#rvlist").append(str);
		} else {
			console.log("방향오류");
		}
	}
	
</script>
<script src="${pageContext.request.contextPath}/asset/js/more.js"></script>
</html>