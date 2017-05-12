<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/HiPowerTemplate.dwt" codeOutsideHTMLIsLocked="false" -->
<%@ include file="/processLogout.jsp" %>
<%@ include file="/checkAccessLevel.jsp" %>
<!-- InstanceBeginEditable name="ScriptLet" -->
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, peterbookmace.example.extra.*, myUtil.*, java.io.*, java.util.*" errorPage="" %>
<!-- InstanceEndEditable -->
<head>
<title>HiPower Management System</title>
<meta http-equiv="content-type" content="application/xhtml; charset=UTF-8" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>
<script type="text/javascript">$(document).ready(function(){ $(document).pngFix(); });</script>
<!--[if lt IE 8.]><link rel="stylesheet" type="text/css" href="css/style-ie.css" /><![endif]-->
<!--[if lt IE 7.]><link rel="stylesheet" type="text/css" href="css/style-ie6.css" /><![endif]-->
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50"><img src="images/0806-1_01.jpg" width="50" height="940" /></td>
    <td valign="top"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="admin/index.jsp"><img src="images/0806-1_02.jpg" width="1000" height="100" /></a></td>
      </tr>
      <tr>
        <td><img src="images/0806-1_04.jpg" width="1000" height="71" /></td>
      </tr>
      <tr>
        <td><table width="1000" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" valign="top"><table width="270" height="683" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40" height="670" background="images/0806-1_05.jpg">&nbsp;</td>
                <td width="190" valign="top" background="images/0806-1_06.jpg"><table width="190" border="0" cellpadding="0" cellspacing="0" background="images/0806-2_06.jpg">
                  <tr>
                    <td height="389">hello: <%=session.getValue("Username")%><BR>
                    <ul id="MenuBar1" class="MenuBarVertical">
<%
	if(UserLevel.equals("1")){
%>                    
                      <li><a class="MenuBarItemSubmenu" href="#">平台管理設定</a>
                          <ul>
                            <li><a href="staff/staffMain.jsp">平台帳號管理</a></li>
                            <li><a href="stafflevel/stafflevelMain.jsp">權限層級設定</a></li>
                            <li><a href="accesscontrol/accesscontrolMain.jsp">功能權限設定</a></li>
                            <li><a href="LanguageMapping/languagemappingMain.jsp">語系設定</a></li>
                            <li><a href="TagMapping/tagmappingMain.jsp">店家主分類設定</a></li>
                            <li><a href="TagMappingChild/tagmappingMain.jsp">店家子分類設定</a></li>
                            <li><a href="paymentMethod/paymentmethodMain.jsp">可接受付款方式</a></li>
                            <li><a href="offday/offdayMain.jsp">休假日定義</a></li>
                            <li><a href="systemparameters/systemparametersMain.jsp">App資料庫版本</a></li>                            
                          </ul>
                      </li>
                      <li><a href="#" class="MenuBarItemSubmenu">店家管理</a>
                          <ul>
                            <li><a href="company/companyMain.jsp">店家基本資料</a></li>
                            <li><a href="CompanyTags/companytagsMain.jsp">店家分類指定</a></li>
                            <li><a href="CompanyContent/companycontentMain.jsp">店家資料多語翻譯</a></li>
                            <li><a href="CompanyContent/companycontentNeverModified.jsp">多語自動翻譯待核</a></li>
                            <li><a href="CompanyNews/companynewsMain.jsp">店家最新活動</a></li>                            
                            <li><a href="CompanyAds/companyadsMain.jsp">店家廣告訊息</a></li>
                            <li><a href="AdsContent/adscontentMain.jsp">店家廣告多語翻譯</a></li>
                            <li><a href="companyTemp/companytempMain.jsp">店家批次匯入建檔</a></li>
                            <li><a href="offDayCompany/offdaycompanyMain.jsp">店家休假日</a></li>
                            <li><a href="storelogintokens/storelogintokensMain.jsp">商家登入token</a></li>
                          </ul>
                      </li>
                      <li><a href="#" class="MenuBarItemSubmenu">彩碼資源管理</a>
                        <ul>
                          <li><a href="caimabatch/caimabatchMain.jsp">彩碼批次設定</a></li>
                          <li><a href="caimabatch/internalAndExternalCodes.jsp">彩碼匯入</a></li>                          
                          <li><a href="caimabatch/caimabatchInputFromCSV.jsp">彩碼批次管理</a></li>
                          <li><a href="CaimaRepository/caimarepositoryMain.jsp">彩碼配置管理</a></li>
                          <li><a href="CaimaAssigment/caimaassigmentMain.jsp">店家彩碼配置</a></li>
                        </ul>
                        </li>
                      <li><a href="#" class="MenuBarItemSubmenu">彩碼行銷專案管理</a>
                          <ul>
                            <li><a href="Promotion/promotionMain.jsp">行銷專案開立</a></li>
                            <li><a href="Announcement/announcementMain.jsp">行銷專案公告(最新消息)</a></li>
                            <li><a href="FansCompany/fanscompanyMain.jsp">專案店群設定</a></li>
                            <li><a href="JoinFans/joinfansMain.jsp">特店粉絲成員管理</a></li>
                            <li><a href="PrizeItem/prizeitemMain.jsp">行銷贈品設定</a></li>
                            <li><a href="RedeemCounter/redeemcounterMain.jsp">贈品兌換點設定</a></li>
                            <li><a href="AwardRedeem/awardredeemMain.jsp">贈品發送兌換記錄</a></li>
                            <li><a href="GoodsTx/goodstxMain.jsp">兌換記錄查詢</a></li>
                            <li><a href="GroupType/grouptypeMain.jsp">彩碼揪團設定</a></li>
                            <li><a href="Group/groupMain.jsp">顧客揪團記錄</a></li>
                            <li><a href="joingroup/joingroupMain.jsp">顧客跟團記錄</a></li>
                          </ul>
                      </li>
                      <li><a href="#" class="MenuBarItemSubmenu">紅利設定與管理</a>
                          <ul>
                            <li><a href="BonusRuleSetting/bonusrulesettingMain.jsp">紅利規則設定</a></li>
                            <li><a href="AllianceUser/allianceuserMain.jsp">紅利分潤成員設定</a></li>
                            <li><a href="RebateRuleSetting/rebaterulesettingMain.jsp">店家紅利公式設定</a></li>
                            <li><a href="StoreGroup/storegroupMain.jsp">店群開立與代管設定</a></li>
                            <li><a href="AllianceUser/allianceuserMain.jsp">allianceuser店群成員管理</a></li>
                            <li><a href="StoreGroupLists/storegrouplistsMain.jsp">紅利店群設定</a></li>
                            <li><a href="BonusGoods/bonusgoodsMain.jsp">紅利兌換品項設定</a></li>
                            <li><a href="#">兌換記錄查詢</a></li>
                            <li><a href="bonustx/bonustxMain.jsp">紅利報表查詢</a></li>
                          </ul>
                      </li>
                      <li><a href="#" class="MenuBarItemSubmenu">紙卡專案</a>
                        <ul>
                          <li><a href="cardproject/cardprojectBatchInput.jsp">客戶紙卡批次作業</a></li>
                          <li><a href="cardproject/cardprojectMain.jsp">紙卡專案管理</a></li>
                          <li><a href="cardrespository/cardrespositoryMain.jsp">卡片管理</a></li>
                          <li><a href="usertype/usertypeMain.jsp">User識別身分</a></li>
                          <li><a href="channelhierarchy/channelhierarchyMain.jsp">出卡通路階層設定</a></li>
                        </ul>
                        </li>
                      <li><a class="MenuBarItemSubmenu" href="#">外客租機回饋管理</a>
                          <ul>
                            <li><a href="RebateRuleSetting/rebaterulesettingMain.jsp">店家回饋公式設定</a>                                </li>
                            
                            <li><a href="Pos/posMain.jsp">店頭機基本資料</a></li>
                            <li><a href="RebateStoreLists/rebatestorelistsMain.jsp">店頭機配置</a></li>
                            <li><a href="PosNotes/posnotesMain.jsp">店頭機維修紀錄</a></li>
                            <li><a href="RebateTx/rebatetxMain.jsp">回饋得紅利</a></li>
                            
                            <li><a href="#">外客回饋報表查詢</a></li>
                            </ul>
                      </li>
                      <li><a href="#" class="MenuBarItemSubmenu">消費者資訊管理</a>
                          <ul>
                            <li><a href="User/userMain.jsp">消費者基本資料</a></li>
                            <li><a href="usertype/usertypeMain.jsp">消費者型態</a></li>
                            <li><a href="CustomerCaima/customercaimaMain.jsp">消費者彩碼</a></li>
                            <li><a href="userpntokens/userpntokensMain.jsp">使用者推播訊息token</a></li>  
                            <li><a href="#">租機旅次對應記錄</a></li>
                                                      
                          </ul>
                      </li>
<%
	}
    else if(UserLevel.equals("2")){
%>    
					 <li><a href="company/companyMain.jsp">店家基本資料</a></li>
                      <li><a href="bonustx/bonustxMain.jsp">紅利報表查詢</a></li>
<%	
    }	
    else{
%>    
					  <li><a href="company/companyMain.jsp">店家基本資料</a></li>
                      <li><a href="BonusGoods/bonusgoodsMain.jsp">紅利兌換品項設定</a></li>   
                      <li><a href="bonustx/bonustxMain.jsp">紅利報表查詢</a></li>
<%	
    }    
%>                      
                      <li><a href="staff/staffModifyPersonalInfo.jsp">個人資料維護</a></li>
                      <li><a href="<%= MM_Logout %>">登出系統</a></li>
                    </ul>
                    <p>
                      <%
        	if(session.getValue("UserLevel")!= null && ((String) session.getValue("UserLevel")).equals("1")){
        %>
                        <a href="<%="/accesscontrol/checkPage.jsp?ServletPath="+request.getServletPath()%>"><img src="images/preferences_icon.png" width="32" height="30" /></a>
                        <%
        	}
        %>
</p>
                      <p>&nbsp;</p>
                      <p>&nbsp;</p></td>
                  </tr>
                </table></td>
                <td width="40" background="images/0806-1_07.jpg">&nbsp;</td>
              </tr>
            </table></td>
            <td valign="top"><!-- InstanceBeginEditable name="EditRegion1" -->
      <p class="headings">Not Found</p>
    <!-- InstanceEndEditable -->
              <BR />
              <!-- InstanceBeginEditable name="EditRegion2" -->There is no such record.<!-- InstanceEndEditable -->
              <p>&nbsp;</p>
              <!-- InstanceBeginEditable name="EditRegion5" -->
      <p style="float:left;margin-top:3px;" class="text_style1">&nbsp;</p>
      <!-- InstanceEndEditable --><!-- InstanceBeginEditable name="EditRegion6" --><li></li>
        <!-- InstanceEndEditable --></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="50"><img src="images/0806-1_03.jpg" width="50" height="940" /></td>
  </tr>
</table>
<script type="text/javascript">
<!--
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"../SpryAssets/SpryMenuBarRightHover.gif"});
//-->
</script>
</body>
<!-- InstanceEnd --></html>
