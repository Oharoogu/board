<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.regex.Pattern"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����! �Խ��� - �Խñ� �Է���</title>
</head>
<body>
<form action="insert.do" method="post" enctype="multipart/form-data" onsubmit="return formCheck();">
		���� : <input type="text" name="title" /><br>
		�ۼ��� : <input type="text" name="writer" /><br>
		content : <textarea rows="10" cols="20" name="content"></textarea><br>
		file : <input type="file" name="filename"><br/>
		<input type="submit"/>
	</form>
<script>
function formCheck() {
 
    var title = document.forms[0].title.value;        // ����ϱ� ������ ������ �����Ͽ� ����ְ�,
    var writer = document.forms[0].writer.value;
    var regdate = document.forms[0].regdate.value;
    var content = document.forms[0].content.value;  // �߰��� - �����Ľ��� �����մϴ�. :)
 
    if (title == null || title == ""){                                    // null���� ���� ��
        alert('������ �Է��ϼ���');                                   // ���â�� ����
        document.forms[0].title.focus();                           // �ش��±׿� ��Ŀ���� �ص�
        return false;                                                     // false�� �����մϴ�.
    }
 
    if (writer == null ||  writer  == ""){          
        alert('�ۼ��ڸ� �Է��ϼ���'); 
        document.forms[0].writer.focus();                      
        return false;               
    }else if(writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
        alert('�̸��� �������� �Է��ϼ���'); 
        document.forms[0].writer.focus();                      
        return false; 
    }
 
    if (regdate == null || regdate == "" ){                            
 
        alert('��¥�� �Է��ϼ���');   
        document.forms[0].regdate.focus();                      
        return false;            
 
    }else if(regdate.match(/^\d\d\d\d\d\d+$/ig)   == null){
        alert('���� ����(6�ڸ�)���� �Է��ϼ���'); 
        document.forms[0].regdate.focus();                      
        return false; 
    }
 
} // function end
</script>
</body>
</html>