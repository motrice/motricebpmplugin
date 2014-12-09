<%-- == Motrice Copyright Notice == 
 
  Motrice Service Platform 
 
  Copyright (C) 2011-2014 Motrice AB 
 
  This program is free software: you can redistribute it and/or modify 
  it under the terms of the GNU Affero General Public License as published by 
  the Free Software Foundation, either version 3 of the License, or 
  (at your option) any later version. 
 
  This program is distributed in the hope that it will be useful, 
  but WITHOUT ANY WARRANTY; without even the implied warranty of 
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
  GNU Affero General Public License for more details. 
 
  You should have received a copy of the GNU Affero General Public License 
  along with this program. If not, see <http://www.gnu.org/licenses/>. 
 
  e-mail: info _at_ motrice.se 
  mail: Motrice AB, Långsjövägen 8, SE-131 33 NACKA, SWEDEN 
  phone: +46 8 641 64 14 
 
--%> 

<%@ include file="/WEB-INF/jspf/htmlTags.jspf"%>
<%--@elvariable id="document" type="org.motrice.bpm.hippo.beans.MotriceDocument"--%>

<fmt:bundle basename="motricebundle">

<c:choose>
	<c:when test="${empty document}">
		<!-- tag:pagenotfound / -->
	</c:when>
	<c:otherwise>
		<c:if test="${not empty document.title}">
			<hst:element var="headTitle" name="title">
				<c:out value="${document.title}" />
			</hst:element>
			<hst:headContribution keyHint="headTitle" element="${headTitle}" />
		</c:if>

		<hst:cmseditlink hippobean="${document}" />
		<h2>${document.title}</h2>
		<p>${document.summary}</p>
		<hst:html hippohtml="${document.body}" />

	</c:otherwise>
</c:choose>

<table cellpadding="0" cellspacing="0" border="0"
	class="display dataTable" width="100%">
	<thead>
		<tr>
			<th><fmt:message key="mycases.process.column.lbl" /></th>
			<th><fmt:message key="mycases.startDate.column.lbl" /></th>
			<th><fmt:message key="mycases.activity.column.lbl" /></th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty tasks}">
				<c:forEach var="task" items="${tasks}">
					<tr>
						<td>${task.processLabel}</td>
						<td><fmt:formatDate value="${task.activityCreated}"
								type="Date" dateStyle="short" timeStyle="short"/></td>
						<td><a href="${task.relativePageLink}">${task.activityLabel}</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3"><fmt:message key="mycases.noActivity.lbl" /></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
</fmt:bundle>