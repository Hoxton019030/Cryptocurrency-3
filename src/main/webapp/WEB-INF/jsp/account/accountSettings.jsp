<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- 引入 navBar_after login -->
<jsp:include page="${contextRoot}/jsp/navbar/CoinShellNavBar_afterlogin.jsp}" />
<head>
<meta charset="UTF-8">
<title>Account Setting | CoinShell</title>
</head>
<body>

  <div class="box" style="background-color: white; text-align: center;">
    <div class="header"><h4>Account Settings</h4></div>
    <div class="form">
      <div>
        <div class="label">Avatar</div>
        <div class="setting-avatar-wrapper">
          <div>
            <div>
              <div class="avatar-item">
                <img src="${ Members.customizedUserAvatar }" class="avatar-item-img" style="border-radius: 50%; height: 100px;">
              </div>
            </div>
          </div>
          <button>Edit Avatar</button>
        </div>
      </div>
      <div>
        <div class="label">User Referral ID</div>
        <input type="text" value="${ Members.MemId }">
      </div>
      <div>
        <div class="label">UserName</div>
        <input type="text" placeholder="Enter your display name..." value="${ Members.customizedUserName }">
        <p color="text3" font-size="12px" class="sc-leb"> <i class="fa-solid fa-triangle-exclamation"></i> Username can
          only be changed once per 7 days.</p>
      </div>
      <div>
        <div class="label">Email Address</div>
        <input type="email" disabled placeholder="Your email address..." value="${Members.eMail}">
      </div>
      <button>Save</button>
    </div>
    <div class="footer">
      <div class="left">
        <div>Password</div>
        <div>Set a unique password to protect your personal account.</div>
      </div>
      <button class="Members">Change password</button>
    </div>
  </div>



  <!-- jQuery + Bootstrap Bundle with Popper | Bootstrap 導入程式 JS -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>

  <script>

  </script>

</body>