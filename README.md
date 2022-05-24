# Yiwen's pending

1. 後臺介面(後台人員能登入):登入後能夠增刪查改會員資料、新聞介面、討論區討論串

2. 控制帳號密碼的格式限制(E-mail不能重複(最優先)，密碼不能小於6碼等等...)
    ( modify controller Post/SignUp method )

3. log In表單，希望可以實現 ...

4. Account Settings 功能 `!Important`

5. Log Out 功能 `!Important`

6. Referral Program 簡易的頁面

6. CoinshellNavBar.jsp 檔案內的 
   c:choose / when (login==null)`button` / otherwise`drop-down` 抓不到 JesssionID

```JS
		<c:choose>
			<c:when test="${ SessionScope.login==null }">
				<div>
					<a href="#" type="button" class="btn btn-primary mr-2"
						data-toggle="modal" data-target="#loginModal"> <i class="fa-solid fa-anchor"></i> Log In
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div>Welcome</div>
			</c:otherwise>
		</c:choose>

```
