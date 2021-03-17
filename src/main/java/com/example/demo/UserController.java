package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
	
	
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	@ModelAttribute("getRadios")
	public List<String> getUserType(){
		List<String> radios = new ArrayList<>();
		radios.add("Customer");
		radios.add("Vendor");
		radios.add("admin");
		return radios;
	}
	
	
	@ModelAttribute("getRadios2")
	public List<String> getUserType3(){
		List<String> radios = new ArrayList<>();
		radios.add("approve");
		radios.add("disapprove");
		//radios.add("admin");
		return radios;
	}
	
	
	@GetMapping("registerChoice")
	public String registrationChoice(@ModelAttribute User user,Model model) {
		
		if(user.getUserType().equals("Customer")) 
		{
		
			return "registration";
		}
		
		else if(user.getUserType().equals("admin")) 
		{
		
			return "registrationAdmin";
		}
		
		
		else if(user.getUserType().equals("Vendor")) 
		{
		
			return "registrationVendor";
		}
		
		
		return "aftersubmit";
	}
	
	
	
	@PostMapping("approve")
	public String approveVendor(@ModelAttribute User user,String uEmail,String uPassword,Model model) {
		
		
		String password=jdbcTemplate.query("select password from admin where Email=?", new ResultSetExtractor<String>() {
	        @Override
	        public String extractData(ResultSet rs) throws SQLException, DataAccessException {
	        	rs.next();
	            return rs.getString("password");
	            }
	           
	       }, uEmail);
		
		
		if(uPassword.equals(password)) {
		
		if(user.getUserType().equals("approve")) {
			jdbcTemplate.update("update vendor set status=? where email=?","t",user.getEmail());
			System.out.println(user.getEmail());
			System.out.println(user.getUserType());
		}
		
		else if(user.getUserType().equals("disapprove")) {
			jdbcTemplate.update("update vendor set status=? where email=?","d",user.getEmail());
	//		System.out.println(user.getEmail());
		//	System.out.println(user.getUserType());
		}
		
		}else {
		model.addAttribute("error", "Incorrect Admin Details");
		return "vendorApprove";
		}
		
		
		return "aftersubmit";
	}
	
	
	
	
	
	/*
	 * @ModelAttribute("getRadiosApproval") public List<String>
	 * getUserTypeApproval(){ List<String> radios2 = new ArrayList<>();
	 * radios2.add("Approve"); radios2.add("Disapprove");
	 * 
	 * return radios2; }
	 */
	
	
	
	
@GetMapping("index")
public String home() {
	return "index";
}

@GetMapping("registration")
public String registerPage(@ModelAttribute User user) {
	return "registrationType";
}

@PostMapping("registration2")
public String registerUser(@Valid @ModelAttribute User user,BindingResult result,Model model) {

	
	if(result.hasErrors()) {
		return "registration";
	}
	
	try {
			jdbcTemplate.update("insert into usertable values(?,?,?,?,?)",user.getFirstName(),user.getLastName(),user.getContactNumber(),user.getEmail(),user.getPassword());
		     
			return "aftersubmit";
	}catch(Exception e) {
		model.addAttribute("error","Email already exists" );
		
		return "registration";
	}
		
	
	
	
}


@PostMapping("registration3")
public String registerAdmin(@Valid @ModelAttribute User user,BindingResult result,Model model) {
if(result.hasErrors()) {
	return "registrationAdmin";
}


try {
	jdbcTemplate.update("insert into admin values(?,?,?,?,?)",user.getFirstName(),user.getLastName(),user.getContactNumber(),user.getEmail(),user.getPassword());
     
	return "aftersubmit";
}catch(Exception e) {
	model.addAttribute("error","This Email Id already exists");
	return "registrationAdmin";
}
}


@PostMapping("registration4")
public String registerVendor(@Valid @ModelAttribute User user, BindingResult result, Model model) {
	
	  if(result.hasErrors()) {
		  return "registrationVendor"; 
	  }
	  try {
		jdbcTemplate.update("insert into vendor(vid,first_name,last_name,contact_number,Email,Password) values(?,?,?,?,?,?)",user.getVid(),user.getFirstName(), user.getLastName(), user.getContactNumber(), user.getEmail(), user.getPassword());
		System.out.println(user.getVid());
		model.addAttribute("fname", user.getFirstName());
		return "vendorApprove";
	  }catch(Exception e) {
		  model.addAttribute("error","This Email Id already exists");
		 
		  return "registrationVendor";
	  }
	}
	  
	  
	  
	  
	  
	@GetMapping("userLogin2")
	public String userLogin(@ModelAttribute User user2) {
		return "userLogin";
	}
	
	
	
	
	@GetMapping("uLogin2")
	public String userLogin2(String uName, String uPassword, Model model) {

		try {

		String password = jdbcTemplate.query("select password from usertable where Email=?",
				new ResultSetExtractor<String>() {
					@Override
					public String extractData(ResultSet rs) throws SQLException, DataAccessException {
						rs.next();
						return rs.getString("password");
					}

				}, uName);

		// System.out.println(password);
		if (password.equals(uPassword)) {
			
			model.addAttribute("uName", uName);
			return "userAccessPage";
		} else {
			model.addAttribute("error", "Email or Password is Incorrect");
			return "userLogin";
		}
		}catch(Exception e) {
			model.addAttribute("error", "Please Enter valid Email");
			return "userLogin";
		}

	}


@GetMapping("adminLogin")
public String adminLogin() {
	return "adminLogin";
}









@GetMapping("aLogin")
public String adminLogin2(String uEmail,String uPassword,Model model){ 
	  try {
String password=jdbcTemplate.query("select password from admin where Email=?", new ResultSetExtractor<String>() {
        @Override
        public String extractData(ResultSet rs) throws SQLException, DataAccessException {
        	rs.next();
            return rs.getString("password");
            }
           
       }, uEmail);
	//System.out.println(password);
  if(password.equals(uPassword)) { 
	  return "adminAccessPage";
	  }
  else {
	  model.addAttribute("error","Email or Password is Incorrect");
return "adminLogin";
  }}
	  catch(Exception e) {
		  model.addAttribute("error","Please Enter valid Email");
		  return "adminLogin";
	  }
}








@GetMapping("vendorLogin")
public String vendorLogin2() {
	return "vendorLogin";
}




@GetMapping("vLogin")
public String vendorLogin3(String uEmail,String uPassword,Model model){ 
	try {
String password=jdbcTemplate.query("select password from vendor where Email=?", new ResultSetExtractor<String>() {
        @Override
        public String extractData(ResultSet rs) throws SQLException, DataAccessException {
        	rs.next();
            return rs.getString("password");
            }
           
       }, uEmail);




String vid=jdbcTemplate.query("select vid from vendor where Email=?", new ResultSetExtractor<String>() {
    @Override
    public String extractData(ResultSet rs) throws SQLException, DataAccessException {
    	rs.next();
        return rs.getString("vid");
        }
       
   }, uEmail);
	



String status=jdbcTemplate.query("select status from vendor where Email=?", new ResultSetExtractor<String>() {
    @Override
    public String extractData(ResultSet rs) throws SQLException, DataAccessException {
    	rs.next();
        return rs.getString("status");
        }
       
   }, uEmail);







String firstName=jdbcTemplate.query("select first_name from vendor where Email=?", new ResultSetExtractor<String>() {
    @Override
    public String extractData(ResultSet rs) throws SQLException, DataAccessException {
    	rs.next();
        return rs.getString("first_name");
        }
       
   }, uEmail);


String lastName=jdbcTemplate.query("select last_name from vendor where Email=?", new ResultSetExtractor<String>() {
    @Override
    public String extractData(ResultSet rs) throws SQLException, DataAccessException {
    	rs.next();
        return rs.getString("last_name");
        }
       
   }, uEmail);




String contactNumber=jdbcTemplate.query("select contact_number from vendor where Email=?", new ResultSetExtractor<String>() {
    @Override
    public String extractData(ResultSet rs) throws SQLException, DataAccessException {
    	rs.next();
        return rs.getString("contact_number");
        }
       
   }, uEmail);





	
  if(password.equals(uPassword)&&status.equals("t")) { 
	  model.addAttribute("vid", vid);
	  model.addAttribute("email",uEmail);
	  model.addAttribute("password", uPassword);
	  model.addAttribute("lastName", lastName);
	  model.addAttribute("firstName", firstName);
	  model.addAttribute("contactNumber", contactNumber);
	  return "vendorAccessPage";
	  }
  else if(password.equals(uPassword)&&status.equals("f")) {
	  model.addAttribute("error","Your Registration is Pending for Approval");
	  return "vendorLogin"; 
  }
  else if(password.equals(uPassword)&&status.equals("d")) {
	  model.addAttribute("error","Your Registration is disapproved");
	  return "vendorLogin"; 
  }
  
  
  else {
	  model.addAttribute("error","Email or Password is Incorrect");
return "vendorLogin";
  }
  
	}catch(Exception e){
		model.addAttribute("error", "Enter valid Email");
		return "vendorLogin";
	}
}









@GetMapping("adminApproval")
public String Approve2(@ModelAttribute Approve approve ) {
	
	
	return "adminApproval";
	
}


/*
 * @PostMapping("approve2") public String Approve3(@ModelAttribute Approve
 * approve) { if (approve.getApproveType().equals("Approve")) { return
 * "afterSubmit"; } else { return "adminLogin"; } }
 */


@GetMapping("vendorDetails")
public String vendorAccess() {
	
	
	return "vendorDetailsPage";
}



@GetMapping("updateInfo")
public String updateEmail(String vid,String vEmail,String vPassword,String vFirstName,String vLastName,String vContactNumber, Model model) {
//model.addAttribute("email",uEmail);
	
	
	
	
	
	
	jdbcTemplate.update("update vendor set password=? where email=?",vPassword,vEmail);
	jdbcTemplate.update("update vendor set first_name=? where email=?",vFirstName,vEmail);
	jdbcTemplate.update("update vendor set last_name=? where email=?",vLastName,vEmail);
	jdbcTemplate.update("update vendor set contact_number=? where email=?",vContactNumber,vEmail);
//	System.out.println(vEmail);
	//System.out.println(vPassword);
//	System.out.println(vContactNumber);
	model.addAttribute("vid", vid);
	return "updateSucess";
	
}



@PostMapping("submitEmail")
public String updateEmail2(String vEmail3,String vEmail2) {
	
	/*
	 * String email=jdbcTemplate.query("select email from vendor where Email=?", new
	 * ResultSetExtractor<String>() {
	 * 
	 * @Override public String extractData(ResultSet rs) throws SQLException,
	 * DataAccessException { rs.next(); return rs.getString("status"); }
	 * 
	 * }, vEmail3);
	 */
	
	
	
	
	
	jdbcTemplate.update("update vendor set email=? where email=?",vEmail2,vEmail3);
	return "aftersubmit";
	
	
	
	
}



@GetMapping("updatePassword")
public String updatePassword() {

	return "vUpdatePassword";
	
}



@GetMapping("clickHere")
public String click() {
	return "aftersubmit";
}


@PostMapping("userSignoff")
public String uSignoff() {
	return "index";
}




@PostMapping("vendorSignoff")
public String vSignoff() {
	return "index";
}



@GetMapping("valid")
public String valid() {
	return "valid";
}










@GetMapping("action1")
public String pending() {

	
	
	/*
	 * List<String>
	 * lastName=jdbcTemplate.query("select email from vendor where status=?", new
	 * ResultSetExtractor<List<String>>() {
	 * 
	 * @Override public List<String> extractData(ResultSet rs) throws SQLException,
	 * DataAccessException { rs.next(); return rs.getString("email"); }
	 * 
	 * }, "f"); System.out.println(lastName);
	 */
	
	/*
	 * String query="select * from vendor where status='f'"; try {
	 * Class.forName("com.mysql.cj.jdbc.Driver");
	 * 
	 * String url="jdbc:mysql://localhost:3306/cts"; String uname="root"; String
	 * pass="Arunkohli@22"; Connection
	 * con=DriverManager.getConnection(url,uname,pass); Statement
	 * st=con.createStatement(); ResultSet rs=st.executeQuery(query); List<String>
	 * list = null;
	 * 
	 * while(rs.next()) { System.out.println(rs.getString("email"));
	 * 
	 * //list.add(rs.getString("email")); //System.out.println(list); } //String
	 * userData=rs.getString("email");
	 * 
	 * 
	 * //st.close(); //con.close(); } catch (ClassNotFoundException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } catch (SQLException e) { //
	 * TODO Auto-generated catch block e.printStackTrace();
	 * //System.out.println("error found"); }
	 */
	
	return "adminApprove";
}	




@GetMapping("update")
public String adminApprove10(String vid) {
	
	
	jdbcTemplate.update("update vendor set status=? where vid=?","t",vid);
	System.out.println(vid);
	return "approveConfirm";
	
}


@GetMapping("delete")
public String adminApprove11(String vid) {
	
	
	jdbcTemplate.update("update vendor set status=? where vid=?","d",vid);
	System.out.println(vid);
	return "DeleteConfirm";
	
}




@PostMapping("addService")
public String showAddService(@ModelAttribute("vendor") VendorRegistration vendor ,String vid,Model model)
{
	
	model.addAttribute("vid", vid);
	return "addService";		
}



@ModelAttribute("typeList")
public List<String> getWashingServiceType(){
	List<String> radios = new ArrayList<>();
	radios.add("Car Washing");
	radios.add("Wheels Cleaning");
	radios.add("Interior Cleaning");
	radios.add("Scratch Removal");
	return radios;
}



@PostMapping("submittodatabase")
public String submitDatabaseService(@Valid @ModelAttribute("vendor") VendorRegistration vendor, BindingResult result)
{
	
	if(result.hasErrors()){
		return "addService";
	}
	 {
			jdbcTemplate.update("insert into servicedetails values(?,?,?,?,?,?,?)",vendor.getVendorId(),vendor.getWcName(),vendor.getWcType(),vendor.getWcStartTime(),vendor.getWcEndTime(),vendor.getWcContact(),vendor.getWcAddress()); 
			return "aftersubmit";
	}
}





@PostMapping("deleteService")
public String DeleteService(@ModelAttribute("vendor") VendorRegistration vendor,String vid,Model model)
{
	model.addAttribute("vid", vid);
	return "deleteService";
}





@PostMapping("deletefromdatabase")
public String DeleteFromDatabase(@Valid @ModelAttribute("vendor") DeleteService vendor, BindingResult result,Model model)
{
	if(result.hasErrors()) {
		System.out.println(vendor.getVendorId());
		System.out.println(vendor.getWcName());
		return "deleteService";
	}
else{
	System.out.println(vendor.getVendorId());
	System.out.println(vendor.getWcName());
	
	
try {

String wcType=jdbcTemplate.query("select wcType from servicedetails where wcName=? and vid=?", new ResultSetExtractor<String>() {
    @Override
    public String extractData(ResultSet rs) throws SQLException, DataAccessException {
    	rs.next();
        return rs.getString("wcType");
        }
       
   }, vendor.getWcName(),vendor.getVendorId());
	


	
		jdbcTemplate.update("delete from servicedetails where vid=? and wcName=?",vendor.getVendorId(),vendor.getWcName());
		return "aftersubmit";
	}

catch(Exception e){
	model.addAttribute("error","Please Enter Valid Washing Center Name");
	
		return "deleteService";
	}}
}



//UPDATING SERVICE
		@PostMapping("updateService")
		public String FirstUpdateService(@ModelAttribute("vendor") VendorRegistration vendor,String vid,Model model)
		{
			
			model.addAttribute("vid", vid);
			return "updateService";
		}



		
		@PostMapping("updatetodatabase")
		public String UpdateToDatabase( @ModelAttribute("vendor") VendorRegistration vendor, BindingResult result,String vid,String wcname,String wctype,String wcstime,String wcetime,String wccontact,String wcaddress,Model model)
		{
			
			if(result.hasErrors()) {
				return "updateService";
			}
			
			
			
			System.out.println(wctype);
			System.out.println(vid);
			jdbcTemplate.update("update servicedetails set wcType=? where vid=? and wcName=?",wctype,vid,wcname);
			jdbcTemplate.update("update servicedetails set wcStartTime=? where  vid=? and wcName=?",wcstime,vid,wcname);
			jdbcTemplate.update("update servicedetails set wcEndTime=? where  vid=? and wcName=?",wcetime,vid,wcname);
			jdbcTemplate.update("update servicedetails set wcContact=? where  vid=? and wcName=?",wccontact,vid,wcname);
			jdbcTemplate.update("update servicedetails set wcAddress=? where  vid=? and wcName=?",wcaddress,vid,wcname);
			model.addAttribute("error", "Your Details Are Updated Succesfully");
			return "approveConfirm2";
			
			
		}
		
		
		
		@PostMapping("searchPage")
		public String SearchPage(String location,String uName,Model model)
		{
			System.out.println(uName);
	
			model.addAttribute("uName",uName);
			return "searchPage";
		}
		
		
		
		
		
		@GetMapping("customerregistration")
		public String CustomerRegistration(String wcname,Model model,String vid,String uName)
		{
		
			model.addAttribute("wcname", wcname);
			model.addAttribute("uName", uName);
			model.addAttribute("vid", vid);
			return "customerBooking";
			
		}
		
		
		
		@PostMapping("bookService")
		public String book(String wcname,String dateslot,String timeslot,String vid,String uName,String uEmail) {
			
		//	System.out.println(wcname);
			System.out.println(uName);
			System.out.println(vid);
			jdbcTemplate.update("insert into booking values(?,?,?,?,?,?,?,?)",vid,uName,uEmail,wcname,dateslot,timeslot,"f","pending");
			
			return "aftersubmit";
			
		}
		
		
		
		
		@GetMapping("action2")
		public String pending10(String vEmail,Model model) {
			

String vid=jdbcTemplate.query("select vid from vendor where Email=?", new ResultSetExtractor<String>() {
    @Override
    public String extractData(ResultSet rs) throws SQLException, DataAccessException {
    	rs.next();
        return rs.getString("vid");
        }
       
   }, vEmail);


			
			model.addAttribute("vEmail", vEmail);
			model.addAttribute("vid", vid);
			return "vendorPending";
			
		}

		

@GetMapping("update1")
public String vendorApprove10(String wcname1,Model model) {
	
	
	jdbcTemplate.update("update booking set status=? where wcname=?","t",wcname1);
	System.out.println(wcname1);
	model.addAttribute("error","Customer Booking Is Approved");
	return "approveConfirm2";
	
}






@GetMapping("delete1")
public String vendorApprove11(String wcname1,Model model) {
	
	
	jdbcTemplate.update("update booking set status=? where wcname=?","d",wcname1);
	System.out.println(wcname1);
	model.addAttribute("error","Customer Booking Is Disapproved");
	return "approveConfirm2";
	
}
		



@GetMapping("action3")
public String pending11(String uName,Model model) {
	System.out.println(uName);
	model.addAttribute("uName", uName);
	return "paymentPage";
	
}




@GetMapping("pay")
public String pay(String uEmail,Model model) {
	
	model.addAttribute("uEmail", uEmail);
	return "debitCard";
}



@GetMapping("payConfirm")
public String pay2(String uEmail,Model model) {
	System.out.println(uEmail);
	jdbcTemplate.update("update Booking set payment=? where uEmail=?","paid","aruntejateja1@gmail.com");
	model.addAttribute("uEmail", uEmail);
	return "aftersubmit2";
}

}