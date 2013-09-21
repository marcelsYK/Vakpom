<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />


<html>
<body>
    <h2>Here is a simple CRUD using Spring MVC and MongoDB.</h2>
 
        <form action="person/save" method="post">
            <input type="hidden" name="id">
            <label for="name">Person Name</label>
            <input type="text" id="name" name="name"/>
            <input type="submit" value="Submit"/>
        </form>
 
    <table border="1">
        <c:forEach var="person" items="${personList}">
            <tr>
                <td>${person.name}</td><td><input type="button" value="delete" onclick="window.location='person/delete?id=${person.id}'"/></td>
            </tr>
        </c:forEach>
    </table>  
</body>
</html>