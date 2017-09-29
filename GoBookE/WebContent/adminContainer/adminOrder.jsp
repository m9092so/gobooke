<%@page import="kr.or.gobooke.book.dao.JdbcBookDao"%>
<%@page import="kr.or.gobooke.common.db.DaoFactory"%>
<%@page import="kr.or.gobooke.book.dao.BookDao"%>
<%@ page contentType="text/html; charset=utf-8"%>

<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>

<script>
	var selectVal;
	var bookno;
	var bookName;
	var price;
	var qty;
	var total;
	$(function() {
		$("#publisher").change(function() {
			selectVal = this.value;
			getBookName(selectVal);
		});

		$("#orderqty").change(function() {
			$("#bookname option:selected").each(function() {
				bookno = $(this).val();
				price = $(this).attr("class");
			});
			qty = this.value;

			total = qty * price;

			$("#totalPrice").val(total + "원");
		});

		$("form").submit(function(event) {
			var data = {
					bookNo : bookno, //no로 title, publisher 검색
					qty : qty,
					totalprice : total
				};
			var params = $.param(data);
			$.ajax({
				url : "/adminBookOrder.do",
				data : params,
				success : function(data){
					location.href = "/view/admin/orderslist.jsp";
				}
			}); 
		});
	});

	function getBookName(selectVal) {
		var data = {
			publisher : selectVal
		};
		var param = $.param(data);
		//ajax요청...!
		$.ajax({
			url : "/searchBookname.do",
			data : param,
			dataType : "json",
			success : function(data) {
				var bookList = data;
				var str = "";
				$.each(bookList,function(index, book) {
					str += "<option value='"+book.no+"' class='"+book.price+"'>"+ book.title + "</option>";
				});

				$("#bookname").html(str);
			}
		});
	}
</script>

<div class="col-sm-9">
  <h2>출판사 도서주문</h2>
  <br>
  <form>
    <div class="content">
      <div class="row">
        <div class="col-sm-6">
          <div class="form-group">
            <label>출판사</label> <select id="publisher"
              class="form-control">
              <option value="말글터">말글터</option>
              <option value="아울북">아울북</option>
              <option value="민음사">민음사</option>
              <option value="덴스토리">덴스토리</option>
              <option value="문학동네">문학동네</option>
            </select>
          </div>
        </div>

        <div class="col-sm-6">
          <div class="form-group">
            <label for="lastname">책제목</label> <select
              class="form-control" id="bookname">
            </select>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <div class="row">
        <div class="col-sm-6">
          <div class="form-group">
            <label for="company">수량</label> <input type="number"
              class="form-control" id="orderqty">
          </div>
        </div>
      </div>
      <!-- /.row -->

      <div class="row">
        <div class="col-sm-6">
          <div class="form-group">
            <input type="text" class="form-control text-right"
              style="border: none; background-color: #ffffff;"
              id="totalPrice" value="0원" disabled>
          </div>
        </div>
        <div class="col-sm-3 ">
          <div class="form-group">
            <input type="submit" class="form-control" id="submit"
              value="발주">
          </div>
        </div>
        <div class="col-sm-3 ">
          <div class="form-group">
            <input type="reset" class="form-control" id="cancle"
              value="취소">
          </div>
        </div>
      </div>
      <!-- /.row -->
    </div>
  </form>
</div>
<!-- /.col-md-9 -->