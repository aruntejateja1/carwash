package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
		model.addAttribute("error", "incorrect admin details");
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
	
	/*
	 * if(result.hasErrors()) { return "registration";
	 * 
	 * }else { if(user.getUserType().equals("Customer")) {
	 */
			jdbcTemplate.update("insert into usertable values(?,?,?,?,?)",user.getFirstName(),user.getLastName(),user.getContactNumber(),user.getEmail(),user.getPassword());
		     
			return "aftersubmit";
			/*
			 * }
			 * 
			 * 
			 * else if(user.getUserType().equals("admin")) {
			 * jdbcTemplate.update("insert into admin values(?,?,?,?,?)",user.getFirstName()
			 * ,user.getLastName(),user.getContactNumber(),user.getEmail(),user.getPassword(
			 * ));
			 * 
			 * return "aftersubmit"; }
			 * 
			 * 
			 * else if (user.getUserType().equals("Vendor")) { jdbcTemplate.
			 * update("insert into vendor(first_name,last_name,contact_number,Email,Password) values(?,?,?,?,?)"
			 * ,user.getFirstName(),user.getLastName(),user.getContactNumber(),user.getEmail
			 * (),user.getPassword());
			 * 
			 * 
			 * model.addAttribute("fname",user.getFirstName()); return "vendorApprove"; }
			 * 
			 * 
			 * 
			 * else { return "registration"; }}
			 */
		
		
		
	
	
	
}


@PostMapping("registration3")
public String registerAdmin(@Valid @ModelAttribute User user,BindingResult result,Model model) {
if(result.hasErrors()) {
	return "registrationAdmin";
}
	jdbcTemplate.update("insert into admin values(?,?,?,?,?)",user.getFirstName(),user.getLastName(),user.getContactNumber(),user.getEmail(),user.getPassword());
     
	return "aftersubmit";
}


@PostMapping("registration4")
public String registerVendor(@Valid @ModelAttribute User user, BindingResult result, Model model) {
	
	  if(result.hasErrors()) {
		  return "registrationVendor"; 
	  }
	  
		jdbcTemplate.update("insert into vendor(vid,first_name,last_name,contact_number,Email,Password) values(?,?,?,?,?,?)",user.getVid(),user.getFirstName(), user.getLastName(), user.getContactNumber(), user.getEmail(), user.getPassword());
		System.out.println(user.getVid());
		model.addAttribute("fname", user.getFirstName());
		return "vendorApprove";
	}
	  
	  
	  
	  
	  
	@GetMapping("userLogin2")
	public String userLogin(@ModelAttribute User user2) {
		return "userLogin";
	}
	
	
	@GetMapping("uLogin2")
	public String userLogin2(String uName, String uPassword, Model model) {

		if (uName.equals(null)) {
			model.addAttribute("error2", "email cannot be null");
		} else if (uPassword.equals(null)) {
			model.addAttribute("error3", "password  cannot be null");
		}

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
			return "userAccessPage";
		} else {
			model.addAttribute("error", "email or password is incorrect");
			return "userLogin";
		}

	}


@GetMapping("adminLogin")
public String adminLogin() {
	return "adminLogin";
}









@GetMapping("aLogin")
public String adminLogin2(String uEmail,String uPassword,Model model){ 
	  
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
	  model.addAttribute("error","email or password is incorrect");
return "adminLogin";
  }
}








@GetMapping("vendorLogin")
public String vendorLogin2() {
	return "vendorLogin";
}




@GetMapping("vLogin")
public String vendorLogin3(String uEmail,String uPassword,Model model){ 
	  
String password=jdbcTemplate.query("select password from vendor where Email=?", new ResultSetExtractor<String>() {
        @Override
        public String extractData(ResultSet rs) throws SQLException, DataAccessException {
        	rs.next();
            return rs.getString("password");
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
	  
	  model.addAttribute("email",uEmail);
	  model.addAttribute("password", uPassword);
	  model.addAttribute("lastName", lastName);
	  model.addAttribute("firstName", firstName);
	  model.addAttribute("contactNumber", contactNumber);
	  return "vendorAccessPage";
	  }
  else if(password.equals(uPassword)&&status.equals("f")) {
	  model.addAttribute("error","your registration is pending for approval");
	  return "vendorLogin"; 
  }
  else if(password.equals(uPassword)&&status.equals("d")) {
	  model.addAttribute("error","your registration disapproved");
	  return "vendorLogin"; 
  }
  
  
  else {
	  model.addAttribute("error","email or password is incorrect");
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
public String updateEmail(String vEmail,String vPassword,String vFirstName,String vLastName,String vContactNumber) {
//model.addAttribute("email",uEmail);
	
	
	
	
	
	
	jdbcTemplate.update("update vendor set password=? where email=?",vPassword,vEmail);
	jdbcTemplate.update("update vendor set first_name=? where email=?",vFirstName,vEmail);
	jdbcTemplate.update("update vendor set last_name=? where email=?",vLastName,vEmail);
	jdbcTemplate.update("update vendor set contact_number=? where email=?",vContactNumber,vEmail);
//	System.out.println(vEmail);
	//System.out.println(vPassword);
//	System.out.println(vContactNumber);
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
	
	
	String query="select * from vendor where status='f'";
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/cts";
		String uname="root";
		String pass="Arunkohli@22";
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		 List<String> list = null;
		 
		while(rs.next()) {
			System.out.println(rs.getString("email"));
			
			//list.add(rs.getString("email"));
			//System.out.println(list);
		}
		//String userData=rs.getString("email");
	
		
		//st.close();
		//con.close();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		//System.out.println("error found");
	}
	
	
	return "aftersubmit";
}	

}

