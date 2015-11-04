<%@page import="java.sql.*"%>
<!DOCTYPE html>

<%@include file="content.jsp" %>
<%@page import="data.DbConnManager" %>


<%
    DbConnManager db = new DbConnManager();
    Connection conn = db.connect();
    Statement stat = conn.createStatement();
   
%>



<script src="validateScript.js"></script>
</head>
<body class="page page-id-39 page-template-default no-fittext basic">

    <div id="page">

        <header id="header">

            <%@include file="header.jsp"%>
            <!-- #site-navigation -->

            <div class="title-card-wrapper">

            </div>

        </header>

        <main>
            <div class="container">
                <div class="row">
                    <div id="primary" class="col-md-12">
                        <div id="comments" class="comments-area">
                            <div id="respond" class="comment-respond">
                                <article id="post-39" class="post-39 page type-page status-publish hentry xfolkentry">


                                    <!-- .entry-content -->

                                    <footer class="clearfix">
                                        <h1 class="entry-title">Add Student</h1>
                                    </footer><!-- .entry -->
                                </article>


                                <div id="respond" class="comment-respond">
                                    <form action='AddStudent1.jsp' id="myForm" method='post' name="myForm">
                                        <table>
                                            <tr>

                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Fullname</label>  </td>
                                                <td><input  type="name" id="fname" name="fname" onmouseout="validate('fname', this.value)"  size="70" aria-required="true"  required placeholder="Enter the fullname"></p>
                                                    </p></td>
                                            </tr>

                                            <tr><td><p class="comment-form-author"><label for="author">First name </label> </td>
                                                <td><input  onmousemove="btn()" type="name"  size="70" aria-required="true" name="firstname" required placeholder="Enter the firstname"></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Last name </label> </td>
                                                <td>
                                                    <input   type="name"  size="70" aria-required="true" name="lastname" required placeholder="Enter the lastname"></p>
                                                </td></tr>
                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Address </label></td> 
                                                <td><input id="author" type="name"  size="70" aria-required="true" name="address" required placeholder="Enter the Address"></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Contact number</label> </td>
                                                <td>
                                                    <input id="author" type="number"  size="70" aria-required="true" name="tel" required placeholder="Enter the Contact number"></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Gender</label></td>
                                            <fieldset>

                                                <td> Male  <input type="radio" name="gender" requred value="Male" style="margin:5px" />
                                                    Female <input type="radio" name="gender"  value="Female" style="margin:5px" /></td>


                                            </fieldset>
                                            </p>
                                            </tr>
                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Date of birth</label></td> 
                                                <td><input id="author" type="date"  size="70" aria-required="true" name="DoB" required placeholder="Enter thr Date Of Birth"></p>
                                                </td>
                                            <tr><td><p class="comment-form-author"><label for="author">NIC no</label></td> 
                                                <td><input id="author" type="name"  size="70" aria-required="true" name="NIC" required placeholder="Enter the NIC no if requred*"></p>
                                                </td>
                                            <tr><td><p class="comment-form-author"><label for="author">School/University/Institute</label></td> 
                                                <td><input id="author" type="name"  size="70" aria-required="true" name="School" required placeholder="Enter the Name"></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Course</label></td> 
                                                <td><%
                                                    
                                                    ResultSet rs = stat.executeQuery("select * from course");%>

                                                        <select name="course" id="course" style="width:350px" onchange='JavaScript:xmlhttpVPost("course1", "course","AddStudentValidate.jsp")'>
                                                            <% while (rs.next()) {%>

                                                            <option value="<%=rs.getString("CourseID")%>"><%=rs.getString("coursename")%></option>


                                                            <%}%>
                                                        </select></p>
                                                        <p><div id="course1"></div></p></td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p class="comment-form-author"><label for="author">Email</label></td> 
                                                <td><input id="author" type="email"  size="70" aria-required="true" name="email" required placeholder="Enter the email"></p>
                                                </td>
                                            </tr>
                                            <tr><td><p class="comment-form-author"><label for="author">Guardian Name </label></td> 
                                                <td><input id="author" type="name"  size="70" aria-required="true" name="Gname" required placeholder="Enter the Name"></p>
                                                </td>
                                            </tr>
                                            <tr><td><p class="comment-form-author"><label for="author">Guardian Phone Number </label> </td>
                                                <td><input id="author" type="number"  size="70" aria-required="true" name="Gtel" required placeholder="Enter the Phone Number"></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p class="form-submit">
                                                        <input type="submit" class="submit" value="Add Student" onclick="checkForm()"> 
                                                    </p></td>
                                            </tr>	
                                        </table>				
                                    </form>
                                </div><!-- #respond -->
                            </div><!-- #comments .comments-area -->			</div>

                    </div>
                </div>

        </main><!-- main -->

        <%@include file="footer.jsp" %>
        <!-- #footer -->
    </div><!-- #page -->



</body></html>
