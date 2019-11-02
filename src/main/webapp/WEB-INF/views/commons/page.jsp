<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="text-align: center;">
    <ul id="pagination" class="pagination pagination-centered"></ul>
</div>
<script type="text/javascript">
    $(function(){
        $("#pagination").twbsPagination({
            totalPages:0${page.pages} || 1,
            startPage:0${page.pageNum} || 1,
            visiblePages: 5,
            first:"首页",
            prev:"上页",
            next:"下页",
            last:"尾页",
            onPageClick:function(event, page){
            //将当前页设置page值
            $("#currentPage").val(page);
            //表单提交
            $("#searchForm").submit();
        }
    });

    });
</script>

