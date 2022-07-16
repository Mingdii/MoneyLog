<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<script type="text/javascript">
	var result = ${fstCateList};
	
	var json  = 
	{
		"cate_fst_cd" : ${result.cate_fst_cd}
		, "cate_fst_name" : ${result.cate_fst_name}
	}
	

</script>
</body>
</html>