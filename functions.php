<?php
require_once 'config.php';
$db = mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME) or die("database is not connected");

//function for showing pages
function showPage($page,$data=""){
include("assets/pages/$page.php");
}



//for getting ids of chat users
function getActiveChatUserIds(){
    global $db;
    $current_user_id = $_SESSION['userdata']['id'];
    $query = "SELECT from_user_id,to_user_id FROM messages WHERE to_user_id=$current_user_id || from_user_id=$current_user_id ORDER BY id DESC";
    $run = mysqli_query($db,$query);
    $data =  mysqli_fetch_all($run,true);
    $ids=array();
    foreach($data as $ch){
    if($ch['from_user_id']!=$current_user_id && !in_array($ch['from_user_id'],$ids)){
       $ids[]=$ch['from_user_id'];
    }

    if($ch['to_user_id']!=$current_user_id && !in_array($ch['to_user_id'],$ids)){
        $ids[]=$ch['to_user_id'];
     }

    }

    return $ids;
}

function getMessages($user_id){
    global $db;
    $current_user_id = $_SESSION['userdata']['id'];
    $query = "SELECT * FROM messages WHERE (to_user_id=$current_user_id && from_user_id=$user_id) || (from_user_id=$current_user_id && to_user_id=$user_id) ORDER BY id DESC";
    $run = mysqli_query($db,$query);
    return  mysqli_fetch_all($run,true);
}

function sendMessage($user_id,$msg){
    global $db;
    $current_user_id = $_SESSION['userdata']['id'];
    $query = "INSERT INTO messages (from_user_id,to_user_id,msg) VALUES($current_user_id,$user_id,'$msg')";
    return mysqli_query($db,$query);

}

function newMsgCount(){
global $db;
$current_user_id = $_SESSION['userdata']['id'];
$query="SELECT COUNT(*) as row FROM messages WHERE to_user_id=$current_user_id && read_status=0";
$run=mysqli_query($db,$query);
return mysqli_fetch_assoc($run)['row'];
}

function updateMessageReadStatus($user_id){
    $cu_user_id = $_SESSION['userdata']['id'];
    global $db;
    $query="UPDATE messages SET read_status=1 WHERE to_user_id=$cu_user_id && from_user_id=$user_id";
    return mysqli_query($db,$query);
}

function gettime($date){
    return date('H:i - (F jS, Y )', strtotime($date));
}

function getAllMessages(){
    $active_chat_ids = getActiveChatUserIds();
    $conversation=array();
    foreach($active_chat_ids as $index=>$id){
        $conversation[$index]['user_id'] = $id;
        $conversation[$index]['messages'] = getMessages($id);
    }
    return $conversation;
}

//function for follow the user
function followUser($user_id){
    global $db;
    $cu = getUser($_SESSION['userdata']['id']);
    $current_user=$_SESSION['userdata']['id'];
    $query="INSERT INTO follow_list(follower_id,user_id) VALUES($current_user,$user_id)";
  
    createNotification($cu['id'],$user_id,"started following you !");
    return mysqli_query($db,$query);
    
}



//function for blocking the user
function blockUser($blocked_user_id){
    global $db;
    $cu = getUser($_SESSION['userdata']['id']);
    $current_user=$_SESSION['userdata']['id'];
    $query="INSERT INTO block_list(user_id,blocked_user_id) VALUES($current_user,$blocked_user_id)";
  
    createNotification($cu['id'],$blocked_user_id,"blocked you");
    $query2="DELETE FROM follow_list WHERE follower_id=$current_user && user_id=$blocked_user_id";
    mysqli_query($db,$query2);
    $query3="DELETE FROM follow_list WHERE follower_id=$blocked_user_id && user_id=$current_user";
    mysqli_query($db,$query3);

   
    return mysqli_query($db,$query);
    
}

//for unblocking the user
function unblockUser($user_id){
    global $db;
    $current_user=$_SESSION['userdata']['id'];
    $query="DELETE FROM block_list WHERE user_id=$current_user && blocked_user_id=$user_id";
    createNotification($current_user,$user_id,"Unblocked you !");
    return mysqli_query($db,$query);   
}

//function checkLikeStatus
function checkLikeStatus($post_id){
    global $db;
    $current_user = $_SESSION['userdata']['id'];
    $query="SELECT count(*) as row FROM likes WHERE user_id=$current_user && post_id=$post_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_assoc($run)['row'];
}

//function for like the post
function like($post_id){
    global $db;
    $current_user=$_SESSION['userdata']['id'];
    $query="INSERT INTO likes(post_id,user_id) VALUES($post_id,$current_user)";
   $poster_id = getPosterId($post_id);
   
   if($poster_id!=$current_user){
    createNotification($current_user,$poster_id,"liked your post !",$post_id);
   }
   

    return mysqli_query($db,$query);
    
}




//function for creating comments
function addComment($post_id,$comment){
    global $db;
 $comment = mysqli_real_escape_string($db,$comment);

    $current_user=$_SESSION['userdata']['id'];
    $query="INSERT INTO comments(user_id,post_id,comment) VALUES($current_user,$post_id,'$comment')";
    $poster_id = getPosterId($post_id);

    if($poster_id!=$current_user){
        createNotification($current_user,$poster_id,"commented on your post",$post_id);
    }
   

    return mysqli_query($db,$query);
    
}


//function for creating comments
function createNotification($from_user_id,$to_user_id,$msg,$post_id=0){
    global $db;
    $query="INSERT INTO notifications(from_user_id,to_user_id,message,post_id) VALUES($from_user_id,$to_user_id,'$msg',$post_id)";
    mysqli_query($db,$query);    
}



//function for getting likes count
function getComments($post_id){
    global $db;
    $query="SELECT * FROM comments WHERE post_id=$post_id ORDER BY id DESC";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_all($run,true);
}

//get notifications

function getNotifications(){
  $cu_user_id = $_SESSION['userdata']['id'];

    global $db;
    $query="SELECT * FROM notifications WHERE to_user_id=$cu_user_id ORDER BY id DESC";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_all($run,true);
}



function getUnreadNotificationsCount(){
    $cu_user_id = $_SESSION['userdata']['id'];
  
      global $db;
      $query="SELECT count(*) as row FROM notifications WHERE to_user_id=$cu_user_id && read_status=0 ORDER BY id DESC";
      $run = mysqli_query($db,$query);
      return mysqli_fetch_assoc($run)['row'];
  }

  function show_time($time){
    return '<time style="font-size:small" class="timeago text-muted text-small" datetime="'.$time.'"></time>';
  }

  function setNotificationStatusAsRead(){
       $cu_user_id = $_SESSION['userdata']['id'];
      global $db;
      $query="UPDATE notifications SET read_status=1 WHERE to_user_id=$cu_user_id";
      return mysqli_query($db,$query);
  }



//function for getting likes count
function getLikes($post_id){
    global $db;
    $query="SELECT * FROM likes WHERE post_id=$post_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_all($run,true);
}

//function for unlike the post
function unlike($post_id){
    global $db;
    $current_user=$_SESSION['userdata']['id'];
    $query="DELETE FROM likes WHERE user_id=$current_user && post_id=$post_id";
    
    $poster_id = getPosterId($post_id);
    if($poster_id!=$current_user){
        createNotification($current_user,$poster_id,"unliked your post !",$post_id);
    }
  
    return mysqli_query($db,$query);
}
function unfollowUser($user_id){
    global $db;
    $current_user=$_SESSION['userdata']['id'];
    $query="DELETE FROM follow_list WHERE follower_id=$current_user && user_id=$user_id";

    createNotification($current_user,$user_id,"Unfollowed you !");
    return mysqli_query($db,$query);
 
    
}


//function for show errors
function showError($field){
if(isset($_SESSION['error'])){
    $error =$_SESSION['error'];
    if(isset($error['field']) && $field==$error['field']){
       ?>
<div class="alert alert-danger my-2" role="alert">
  <?=$error['msg']?>
</div>
       <?php
    }
}
}


//function for show prevformdata
function showFormData($field){
    if(isset($_SESSION['formdata'])){
        $formdata =$_SESSION['formdata'];
        return $formdata[$field];
    }
 
}


//for checking duplicate email
function isEmailRegistered($email){
    global $db;
    $query="SELECT count(*) as row FROM users WHERE email='$email'";
    $run=mysqli_query($db,$query);
    $return_data = mysqli_fetch_assoc($run);
    return $return_data['row'];
}

//for checking duplicate username
function isUsernameRegistered($username){
    global $db;
    $query="SELECT count(*) as row FROM users WHERE username='$username'";
    $run=mysqli_query($db,$query);
    $return_data = mysqli_fetch_assoc($run);
    return $return_data['row'];
}

//for checking duplicate username by other
function isUsernameRegisteredByOther($username){
    global $db;
    $user_id=$_SESSION['userdata']['id'];
    $query="SELECT count(*) as row FROM users WHERE username='$username' && id!=$user_id";
    $run=mysqli_query($db,$query);
    $return_data = mysqli_fetch_assoc($run);
    return $return_data['row'];
}

//for validating the signup form
function validateSignupForm($form_data){
$response=array();
$response['status']=true;
  
    if(!$form_data['password']){
        $response['msg']="password is not given";
        $response['status']=false;
        $response['field']='password';
    }
   
    if(!$form_data['username']){
        $response['msg']="username is not given";
        $response['status']=false;
        $response['field']='username';
    }
    
    if(!$form_data['email']){
        $response['msg']="email is not given";
        $response['status']=false;
        $response['field']='email';
    }
    
    if(!$form_data['last_name']){
        $response['msg']="last name is not given";
        $response['status']=false;
        $response['field']='last_name';
    }
    if(!$form_data['first_name']){
        $response['msg']="first name is not given";
        $response['status']=false;
        $response['field']='first_name';
    }
    if(isEmailRegistered($form_data['email'])){
        $response['msg']="email id is already registered";
        $response['status']=false;
        $response['field']='email';
    }
    if(isUsernameRegistered($form_data['username'])){
        $response['msg']="username is already registered";
        $response['status']=false;
        $response['field']='username';
    }

    return $response;

}


//for validate the login form
function validateLoginForm($form_data){
    $response=array();
    $response['status']=true;
    $blank=false;
      
        if(!$form_data['password']){
            $response['msg']="password is not given";
            $response['status']=false;
            $response['field']='password';
            $blank=true;
        }
       
        if(!$form_data['username_email']){
            $response['msg']="username/email is not given";
            $response['status']=false;
            $response['field']='username_email';
            $blank=true;
        }

        if(!$blank && !checkUser($form_data)['status'] ){
            $response['msg']="something is incorrect, we can't find you";
            $response['status']=false;
            $response['field']='checkuser';
        }else{
            $response['user']=checkUser($form_data)['user'];
        }
        
      
       
       
    
    
        return $response;
    
    }


//for checking the user
function checkUser($login_data){
    global $db;
 $username_email = $login_data['username_email'];
 $password=md5($login_data['password']);

 $query = "SELECT * FROM users WHERE (email='$username_email' || username='$username_email') && password='$password'";
 $run = mysqli_query($db,$query);
 $data['user'] = mysqli_fetch_assoc($run)??array();
 if(count($data['user'])>0){
     $data['status']=true;
 }else{
    $data['status']=false;

 }

 return $data;
}


//for getting userdata by id
function getUser($user_id){
    global $db;
 $query = "SELECT * FROM users WHERE id=$user_id";
 $run = mysqli_query($db,$query);
 return mysqli_fetch_assoc($run);

}


//for filtering the suggestion list
function filterFollowSuggestion(){
$list = getFollowSuggestions();
$filter_list  = array();
foreach($list as $user){
    if(!checkFollowStatus($user['id']) && !checkBS($user['id']) && count($filter_list)<5){
     $filter_list[]=$user;
    }
}

return $filter_list;
}

//for checking the user is followed by current user or not
function checkFollowStatus($user_id){
    global $db;
    $current_user = $_SESSION['userdata']['id'];
    $query="SELECT count(*) as row FROM follow_list WHERE follower_id=$current_user && user_id=$user_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_assoc($run)['row'];
}

//for checking the user is followed by current user or not
function checkBlockStatus($current_user,$user_id){
    global $db;
    
    $query="SELECT count(*) as row FROM block_list WHERE user_id=$current_user && blocked_user_id=$user_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_assoc($run)['row'];
}


function checkBS($user_id){
    global $db;
    $current_user = $_SESSION['userdata']['id'];
    $query="SELECT count(*) as row FROM block_list WHERE (user_id=$current_user && blocked_user_id=$user_id) || (user_id=$user_id && blocked_user_id=$current_user)";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_assoc($run)['row'];
}
//

//for getting users for follow suggestions
function getFollowSuggestions(){
    global $db;

    $current_user = $_SESSION['userdata']['id'];
    $query = "SELECT * FROM users WHERE id!=$current_user";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_all($run,true);
}

//get followers count
function getFollowers($user_id){
    global $db;
    $query = "SELECT * FROM follow_list WHERE user_id=$user_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_all($run,true);
}

//get followers count
function getFollowing($user_id){
    global $db;
    $query = "SELECT * FROM follow_list WHERE follower_id=$user_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_all($run,true);
}

//for getting posts by id
function getPostById($user_id){
    global $db;
 $query = "SELECT * FROM posts WHERE user_id=$user_id ORDER BY id DESC";
 $run = mysqli_query($db,$query);
 return mysqli_fetch_all($run,true);

}

//for getting post
function getPosterId($post_id){
    global $db;
 $query = "SELECT user_id FROM posts WHERE id=$post_id";
 $run = mysqli_query($db,$query);
 return mysqli_fetch_assoc($run)['user_id'];

}

//for searching the users
function searchUser($keyword){
    global $db;
 $query = "SELECT * FROM users WHERE username LIKE '%".$keyword."%' || (first_name LIKE '%".$keyword."%' || last_name LIKE '%".$keyword."%') LIMIT 5";
 $run = mysqli_query($db,$query);
 return mysqli_fetch_all($run,true);

}




//for getting userdata by username
function getUserByUsername($username){
    global $db;
 $query = "SELECT * FROM users WHERE username='$username'";
 $run = mysqli_query($db,$query);
 return mysqli_fetch_assoc($run);



}

//for getting posts
function getPost(){
    global $db;
 $query = "SELECT users.id as uid,posts.id,posts.user_id,posts.post_img,posts.post_text,posts.created_at,users.first_name,users.last_name,users.username,users.profile_pic FROM posts JOIN users ON users.id=posts.user_id ORDER BY id DESC";

 $run = mysqli_query($db,$query);
 return mysqli_fetch_all($run,true);

}


function deletePost($post_id){
    global $db;
$user_id=$_SESSION['userdata']['id'];
    $dellike = "DELETE FROM likes WHERE post_id=$post_id && user_id=$user_id";
    mysqli_query($db,$dellike);
    $delcom = "DELETE FROM comments WHERE post_id=$post_id && user_id=$user_id";
    mysqli_query($db,$delcom);
    $not = "UPDATE notifications SET read_status=2 WHERE post_id=$post_id && to_user_id=$user_id";
mysqli_query($db,$not);


    $query = "DELETE FROM posts WHERE id=$post_id";
    return mysqli_query($db,$query);
}

//for getting posts dynamically
function filterPosts(){
    $list = getPost();
    $filter_list  = array();
    foreach($list as $post){
        if(checkFollowStatus($post['user_id']) || $post['user_id']==$_SESSION['userdata']['id']){
         $filter_list[]=$post;
        }
    }
    
    return $filter_list;
    }



//for creating new user
function createUser($data){
 global $db;
 $first_name = mysqli_real_escape_string($db,$data['first_name']);
 $last_name = mysqli_real_escape_string($db,$data['last_name']);
 $gender = $data['gender'];
 $email = mysqli_real_escape_string($db,$data['email']);
 $username = mysqli_real_escape_string($db,$data['username']);
 $password = mysqli_real_escape_string($db,$data['password']);
 $password = md5($password);

 $query = "INSERT INTO users(first_name,last_name,gender,email,username,password) ";
 $query.="VALUES ('$first_name','$last_name',$gender,'$email','$username','$password')"; 
 return mysqli_query($db,$query);
}

//function for verify email
function verifyEmail($email){
    global $db;
    $query="UPDATE users SET ac_status=1 WHERE email='$email'";
    return mysqli_query($db,$query);
}

//function for verify email
function resetPassword($email,$password){
    global $db;
    $password=md5($password);
    $query="UPDATE users SET password='$password' WHERE email='$email'";
    return mysqli_query($db,$query);
}

//for validating update form
function validateUpdateForm($form_data,$image_data){
    $response=array();
    $response['status']=true;
      

        if(!$form_data['username']){
            $response['msg']="username is not given";
            $response['status']=false;
            $response['field']='username';
        }
        
        if(!$form_data['last_name']){
            $response['msg']="last name is not given";
            $response['status']=false;
            $response['field']='last_name';
        }
        if(!$form_data['first_name']){
            $response['msg']="first name is not given";
            $response['status']=false;
            $response['field']='first_name';
        }
  
        if(isUsernameRegisteredByOther($form_data['username'])){
            $response['msg']=$form_data['username']." is already registered";
            $response['status']=false;
            $response['field']='username';
        }
    
       if($image_data['name']){
           $image = basename($image_data['name']);
           $type = strtolower(pathinfo($image,PATHINFO_EXTENSION));
           $size = $image_data['size']/1000;

           if($type!='jpg' && $type!='jpeg' && $type!='png'){
            $response['msg']="only jpg,jpeg,png images are allowed";
            $response['status']=false;
            $response['field']='profile_pic';
        }

        if($size>1000){
            $response['msg']="upload image less then 1 mb";
            $response['status']=false;
            $response['field']='profile_pic';
        }
       }

        return $response;
    
    }
    

    //function for updating profile

    function updateProfile($data,$imagedata){
        global $db;
        $first_name = mysqli_real_escape_string($db,$data['first_name']);
        $last_name = mysqli_real_escape_string($db,$data['last_name']);
        $username = mysqli_real_escape_string($db,$data['username']);
        $password = mysqli_real_escape_string($db,$data['password']);

if(!$data['password']){
$password = $_SESSION['userdata']['password'];
}else{
    $password = md5($password);
    $_SESSION['userdata']['password']=$password;
}

$profile_pic="";
if($imagedata['name']){
    $image_name = time().basename($imagedata['name']);
    $image_dir="../images/profile/$image_name";
    move_uploaded_file($imagedata['tmp_name'],$image_dir);
    $profile_pic=", profile_pic='$image_name'";
}
       
      
    
        $query = "UPDATE users SET first_name = '$first_name', last_name='$last_name',username='$username',password='$password' $profile_pic WHERE id=".$_SESSION['userdata']['id'];
return mysqli_query($db,$query);

    }


    //for validating add post form
    function validatePostMedia($media_data) {
        $response = array();
        $response['status'] = true;
    
        if (!isset($media_data['name']) || empty($media_data['name'])) {
            $response['msg'] = "No file is selected";
            $response['status'] = false;
            $response['field'] = 'post_img';
        } else {
            $file_name = $media_data['name'];
            $file_type = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
            $file_size = $media_data['size'] / 1000;
    
            $allowed_image_types = array('jpg', 'jpeg', 'png');
            $allowed_video_types = array('mp4', 'avi', 'mov');
    
            if (!in_array($file_type, $allowed_image_types) && !in_array($file_type, $allowed_video_types)) {
                $response['msg'] = "Only image (jpg, jpeg, png) and video (mp4, avi, mov) files are allowed";
                $response['status'] = false;
                $response['field'] = 'post_img';
            }
    
            if (in_array($file_type, $allowed_image_types)) {
                if ($file_size > 2000) {
                    $response['msg'] = "Upload image less than 1 MB";
                    $response['status'] = false;
                    $response['field'] = 'post_img';
                }
            }
        }
    
        return $response;
    }


    //for creating new user
    function createPost($text, $media) {
        global $db;
    
        $post_text = mysqli_real_escape_string($db, $text['post_text']);
        $user_id = $_SESSION['userdata']['id'];
    
        $media_name = "";
    
        if (isset($media['name']) && !empty($media['name'])) {
            $media_name = time() . basename($media['name']);
            $media_dir = "../images/posts/$media_name";
            move_uploaded_file($media['tmp_name'], $media_dir);
        }
    
        $query = "INSERT INTO posts(user_id, post_text, post_img)";
        $query .= " VALUES ($user_id, '$post_text', '$media_name')"; 
        return mysqli_query($db,$query);
    }

   // for getting posts
   function deleteUser() {
    global $db;
    $response = array();
    $userId = $_SESSION['userdata']['id'];

    // Delete user's messages as the sender
    $deleteSenderMessagesQuery = "DELETE FROM messages WHERE from_user_id = $userId";
    mysqli_query($db, $deleteSenderMessagesQuery);

    // Delete user's messages as the recipient
    $deleteRecipientMessagesQuery = "DELETE FROM messages WHERE to_user_id = $userId";
    mysqli_query($db, $deleteRecipientMessagesQuery);

    // Delete user's likes
    $deleteLikesQuery = "DELETE FROM likes WHERE user_id = $userId";
    mysqli_query($db, $deleteLikesQuery);

    // Delete user's comments
    $deleteCommentsQuery = "DELETE FROM comments WHERE user_id = $userId";
    mysqli_query($db, $deleteCommentsQuery);

    // Delete user's follow_list
    $deleteFollowListQuery = "DELETE FROM follow_list WHERE follower_id = $userId";
    mysqli_query($db, $deleteFollowListQuery);

    // Delete user's notifications
    $deleteNotificationsQuery = "DELETE FROM notifications WHERE from_user_id = $userId";
    mysqli_query($db, $deleteNotificationsQuery);

    // Delete user's posts
    $deletePostsQuery = "DELETE FROM posts WHERE user_id = $userId";
    mysqli_query($db, $deletePostsQuery);

    // Delete user from block_list
    $deleteBlockListQuery = "DELETE FROM block_list WHERE blocked_user_id = $userId";
    mysqli_query($db, $deleteBlockListQuery);

    // Delete the user's account
    $deleteUserQuery = "DELETE FROM users WHERE id = $userId";
    $result = mysqli_query($db, $deleteUserQuery);

    if ($result) {
        $response['status'] = true;
        $response['msg'] = "User deleted successfully.";
    } else {
        $response['status'] = false;
        $response['msg'] = "Failed to delete user.";
    }

    return $response;
}

function makeUrlsClickable($text) {
    // Regular expression to match URLs
    $urlRegex = '/(https?:\/\/[^\s]+)/';
  
    // Replace URLs with clickable hyperlinks
    $replacedText = preg_replace_callback($urlRegex, function($matches) {
      $url = $matches[0];
  
      // Check if the URL is valid
      if (filter_var($url, FILTER_VALIDATE_URL)) {
        return '<a href="' . $url . '">' . $url . '</a>';
      } else {
        return $url; // Return the URL as is if it's not valid
      }
    }, $text);
  
    return $replacedText;
}
?>