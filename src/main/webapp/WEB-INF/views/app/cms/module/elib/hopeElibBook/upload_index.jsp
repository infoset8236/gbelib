<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/cms/js/malsup.jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript">
  var started = false;
  $(function () {
    $('button#search_btn').on('click', function (e) {
      $('#viewPage').val(1);
      $('#bookListForm').submit();
    });

    $('a#dialog-add').on('click', function (e) {
      e.preventDefault();

      $('#dialog-1').load('edit.do?editMode=ADD&type=${book.type}', function (response, status, xhr) {
        $('#dialog-1').dialog('open');
        $('select#cate1_dialog').select2();
        $('select#com_code_dialog').select2();
        $('select#library_code_dialog').select2();
        $('select#device_dialog').select2();
        <c:if test="${book.type != 'ADO'}">
        $('select#cate2_dialog').select2();
        $('select#cate1_dialog').on('change', function (e) {
          updateSubcategory_dialog($(this).val());
        });
        updateSubcategory_dialog($('select#cate1_dialog').val());
        </c:if>
      });
    });
    $('a.dialog-modify').on('click', function (e) {
      e.preventDefault();

      $('#dialog-1').load('edit.do?editMode=MODIFY&type=${book.type}&book_idx=' + $(this).data('book_idx'), function (response, status, xhr) {
        $('#dialog-1').dialog('open');
        $('select#cate1_dialog').select2();
        $('select#com_code_dialog').select2();
        $('select#library_code_dialog').select2();
        $('select#device_dialog').select2();
        <c:if test="${book.type != 'ADO'}">
        $('select#cate2_dialog').select2();
        $('select#cate1_dialog').on('change', function (e) {
          updateSubcategory_dialog($(this).val());
        });
        updateSubcategory_dialog($('select#cate1_dialog').val());
        </c:if>
      });
    });

    $('a.delete-btn').on('click', function (e) {
      e.preventDefault();

      if (confirm('삭제하시겠습니까?')) {
        $('#hiddenForm_book_idx').val($(this).data('book_idx'));
        if (doAjaxPost($('#hiddenForm'))) {
          location.reload();
        }
      }
    });

    $('a.approve-btn').on('click', function (e) {
      if (confirm('승인하시겠습니까?')) {
        $('#hiddenForm #editMode').val('approve');
        $('#hiddenForm_book_idx').val($(this).data('book_idx'));
        $('#hiddenForm').attr('action', 'approve.do');
        $('#hiddenForm').val($(this).data('book_idx'));
        if (doAjaxPost($('#hiddenForm'))) {
          location.reload();
        }
      }
      e.preventDefault();
    });

    $('a#excelDownload').on('click', function (e) {
      e.preventDefault();

      if ('${fn:length(bookList)}' > 0) {
        $('#hiddenForm').attr('action', 'excelDownload.do').submit();
        $('#hiddenForm').attr('action', 'save.do');
      } else {
        alert('해당 내역이 없습니다.');
      }
    });

    <c:if test="${book.type == 'ADO'}">
    $('select#cate1').on('change', submit);
    </c:if>
    <c:if test="${book.type != 'ADO'}">
    $('select#cate2').on('change', submit);
    </c:if>
    $('select#library_code').on('change', submit);
    $('select#device').on('change', submit);
    $('select#com_code').on('change', submit);
    $('select#sortField').on('change', submit);
    $('select#rowCount').on('change', submit);

    $('a#fileUpload').on('click', function (e) {
      e.preventDefault();

      if ($('input#mfile').val() == '') {
        alert('엑셀 파일을 선택해주세요.');
        return;
      }
      if ($('select#upload_com_code').val() == '') {
        alert('공급사를 선택해주세요.');
        return;
      }
      if ($('select#upload_library_code').val() == '') {
        alert('도서관을 선택해주세요.');
        return;
      }

      if (started) {
        alert('작업을 진행 중입니다. 잠시 기다려주세요.');
        return;
      }

      if ($('input[name=operation]:checked').val() != 'M') {
        started = true;
      }

      $('form#file-upload-form').submit();
    });
  });

  function submit(e) {
    e.preventDefault();
    $('#bookListForm').submit();
  }
</script>

<h2>작업 순서</h2>
<h3>메타 추가</h3>
<ul>
    <li>1. '테스트 모드'를 선택하고 'Insert / Update' 작업으로 추가할 메타를 업로드한다</li>
    <li>2. 오류 메시지가 나오면 엑셀 파일을 수정한다</li>
    <li>3. 오류 메시지 없이 완료되면 '실제 반영'을 선택하고 메타를 업로드한다</li>
    <li>4. 업로드된 전자책은 '미승인' 상태가 되며 <br/>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="//www.gbelib.kr/elib/module/elib/set.do?debug=true">https://www.gbelib.kr/elib/module/elib/set.do?debug=true</a> 를 열면<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;현 세션이 일시적으로 미승인 자료만 열람 가능한 상태가 된다.<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;(취소는 <a href="//www.gbelib.kr/elib/module/elib/set.do?debug=false">https://www.gbelib.kr/elib/module/elib/set.do?debug=false</a>)
    </li>
    <li>5. 미승인 자료로 대출, 반납, 연장, 예약, 책 열기를 테스트한다</li>
    <li>6. 전자책이 정상 작동하면 작업 종류를 '승인'으로 선택하고 메타를 다시 업로드 한다</li>
</ul>
<br/>
<h3>메타 수정</h3>
<ul>
    <li>1. '테스트 모드'를 선택하고 'Insert / Update' 작업으로 수정된 전자책 메타를 업로드한다</li>
    <li>2. 오류 메시지가 나오면 엑셀 파일을 수정한다</li>
    <li>3. 오류 메시지 없이 완료되면 '실제 반영'을 선택하고 메타를 업로드한다</li>
</ul>
<br/>
<h3>메타 삭제</h3>
<ul>
    <li>1. '테스트 모드'를 선택하고 'Delete' 작업으로 삭제할 메타를 업로드한다</li>
    <li>2. 오류 메시지가 나오면 엑셀 파일을 수정한다</li>
    <li>3. 오류 메시지 없이 완료되면 '실제 반영'을 선택하고 메타를 업로드한다</li>
</ul>
<br/>
<form id="file-upload-form" name="file-upload-form" action="result.do" method="POST" enctype="multipart/form-data">
    <table class="type2" style="width: 600px;">
        <colgroup>
            <col width="100px;">
            <col width="500px;">
        </colgroup>
        <tbody>
        <tr>
            <th>엑셀 파일</th>
            <td><input type="file" id="mfile" name="mfile"></td>
        </tr>
        <tr>
            <th>작업 종류</th>
            <td>
                <input type="radio" name="operation" id="operation1" value="I" checked="checked" style="width: 20px;"> <label for="operation1">Insert / Update</label>
                &nbsp;<input type="radio" name="operation" id="operation2" value="D" style="width: 20px;"> <label for="operation2">Delete</label>
                &nbsp;<input type="radio" name="operation" id="operation3" value="A" style="width: 20px;"> <label for="operation3">승인</label>
                &nbsp;<input type="radio" name="operation" id="operation4" value="DA" style="width: 20px;"> <label for="operation4">승인 취소</label>
                &nbsp;<input type="radio" name="operation" id="operation5" value="M" style="width: 20px;"> <label for="operation5">마크URL 추출</label><br/>
            </td>
        </tr>
        <tr>
            <th>새 카테고리</th>
            <td>
                <input type="radio" name="new_category" id="new_category1" value="1" checked="checked" style="width: 20px;"> <label for="new_category1">추가하지 않음</label>
                &nbsp;<input type="radio" name="new_category" id="new_category2" value="2" style="width: 20px;"> <label for="new_category2">새로 추가</label><br/>
                * '추가하지 않음'을 선택할 경우 미등록 카테고리 발견 시 작업 중단<br/>
                * '새로 추가'는 반드시 도서관으로부터 새 카테고리 등록 승인을 받은 후 진행해야 함
            </td>
        </tr>
        <tr>
            <th>테스트 or 실제 반영</th>
            <td>
                <input type="radio" name="run_mode" id="run_mode1" value="DRY_RUN" checked="checked" style="width: 20px;"> <label for="run_mode1">테스트 모드</label>
                &nbsp;<input type="radio" name="run_mode" id="run_mode2" value="DEPLOY" style="width: 20px;"> <label for="run_mode2">실제 반영</label><br/>
                * 테스트 모드로 테스트 후 이상이 없을 시 실제 반영
            </td>
        </tr>
        <tr>
            <th colspan="2" style="text-align: center;">
                <a href="#" class="btn" id="fileUpload">작업 시작!</a><br/>
                * 엑셀 파일 용량에 따라 수십 초 ~ 수 분이 걸릴 수 있습니다
            </th>
        </tr>
        </tbody>
    </table>
</form>