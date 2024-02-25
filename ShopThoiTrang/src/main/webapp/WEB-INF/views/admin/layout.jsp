<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản trị Website</title>
        <tiles:insertAttribute name="head"/>
    </head>
    <body>
        <section class="clearfix header bg-danger">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-lg navbar-dark bg-danger" style="margin-bottom: unset">
                    <tiles:insertAttribute name="menu"/>
                </nav>
            </div>
        </section>
        <section class="clearfix maincontent admin__scroll">
            <div class="container-fluid py-3 container">
                <tiles:insertAttribute name="body"/>
            </div>
        </section>
        <section class="clearfix footer bg-danger">
            <div class="container-fluid text-white text-center py-3">
                Thiết kế bởi: Trần Nhật Quang
            </div>
        </section>
    </body>
</html>
