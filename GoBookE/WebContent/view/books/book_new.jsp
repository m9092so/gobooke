<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title></title>
<meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>GoBook-E 신간도서</title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,700,800' rel='stylesheet' type='text/css'>

    <!-- Bootstrap and Font Awesome css -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Css animations  -->
    <link href="../../css/animate.css" rel="stylesheet">

    <!-- Theme stylesheet, if possible do not edit this stylesheet -->
    <link href="../../css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- Custom stylesheet - for your changes -->
    <link href="../../css/custom.css" rel="stylesheet">

    <!-- Favicon and apple touch icons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png" />
    <link rel="apple-touch-icon" sizes="57x57" href="img/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="img/apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png" />

    <!-- owl carousel css -->

    <link href="../../css/owl.carousel.css" rel="stylesheet">
    <link href="../../css/owl.theme.css" rel="stylesheet">
</head>
<body>
  <div id="all">
        <header>
            <!-- *** TOP *** -->
            <jsp:include page="../../layout/header.jsp"/>
            <!-- *** TOP END *** -->
            <!-- *** NAVBAR ***  -->
            <jsp:include page="../../layout/nav.jsp"/>
            <!-- *** NAVBAR END *** -->
        </header>

        <!-- *** LOGIN MODAL *** -->
        <jsp:include page="../../layout/loginMo.jsp"/>        
        <!-- *** LOGIN MODAL END *** -->

        <div id="heading-breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <h1>신간도서</h1>
                    </div>
                    <div class="col-md-5">
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a>
                            </li>
                            <li>신간도서</li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>

        <div id="content">
            <div class="container">

                <section>
                    <div class="row">
                    <div class="heading">
                                <h2>국내신간도서</h2>
                    </div>
                    <div class="row portfolio">
                      <c:forEach items="${inBookList}" var="inBook" begin="0" end="5" step="1">
                      <div class="col-sm-4">
                            <div class="box-image" style="width: 300px; height: 400px;">
                                <div class="image">
                                    <img src="../../img/books/${inBook.image}" style="width: 300px; height: 400px;" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="${pageContext.servletContext.contextPath}/book/bookDetail.do?book_no=${inBook.no}">${inBook.title}</a></h3> 
                                </div>
                                <div class="text">
                                    
                                    <p class="buttons">
                                        <a href="${pageContext.servletContext.contextPath}/book/bookDetail.do?book_no=${inBook.no}" class="btn btn-template-transparent-primary">상세보기</a>
                                        <a href="../../view/orders/orderBackup.html" class="btn btn-template-transparent-primary"><i class="fa fa-won"></i>바로구매</a>
                                        <a href="${pageContext.servletContext.contextPath}/cart/add.do?bookNo=${inBook.no}&cartBookQty=1" class="btn btn-template-transparent-primary"><i class="fa fa-shopping-cart"></i>장바구니에 담기</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>
                      </c:forEach>
                      
                      <div class="heading">
                                <h2>외국신간도서</h2>
                    </div>
                        
                        <c:forEach items="${exBookList}" var="exBook" begin="0" end="5" step="1">
                      <div class="col-sm-4">
                            <div class="box-image" style="width: 300px; height: 400px;">
                                <div class="image">
                                    <img src="../../img/books/${exBook.image}" style="width: 300px; height: 400px;" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="${pageContext.servletContext.contextPath}/book/bookDetail.do?book_no=${inBook.no}">${exBook.title}</a></h3> 
                                </div>
                                <div class="text">
                                    
                                    <p class="buttons">
                                        <a href="${pageContext.servletContext.contextPath}/book/bookDetail.do?book_no=${exBook.no}" class="btn btn-template-transparent-primary">상세보기</a>
                                        <a href="../../view/orders/orderBackup.html" class="btn btn-template-transparent-primary"><i class="fa fa-won"></i>바로구매</a>
                                        <a href="${pageContext.servletContext.contextPath}/cart/add.do?bookNo=${exBook.no}&cartBookQty=1" class="btn btn-template-transparent-primary"><i class="fa fa-shopping-cart"></i>장바구니에 담기</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>
                      </c:forEach>
                        
                     
                       
                    </div>
                    
                    </div>
                    
                </section>

            </div>
            <!-- /.container -->

            <!-- /.bar -->

        </div>
        <!-- /#content -->

        <!-- *** GET IT ***
_________________________________________________________ -->

        


       <!-- *** FOOTER *** -->
        <jsp:include page="/layout/footer.jsp"/>
        <!-- /#footer -->

        <!-- *** FOOTER END *** -->



    </div>
    <!-- /#all -->

    <!-- #### JAVASCRIPT FILES ### -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>
        window.jQuery || document.write('<script src="../../js/jquery-1.11.0.min.js"><\/script>')
    </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="../../js/jquery.cookie.js"></script>
    <script src="../../js/waypoints.min.js"></script>
    <script src="../../js/jquery.counterup.min.js"></script>
    <script src="../../js/jquery.parallax-1.1.3.js"></script>
    <script src="../../js/front.js"></script>

    

    <!-- owl carousel -->
    <script src="../../js/owl.carousel.min.js"></script>
</body>
</html>