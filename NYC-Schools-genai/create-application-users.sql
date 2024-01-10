 DECLARE
    l_password  VARCHAR2(50)        :=  'APEX##123##';
    l_app_id    NUMBER              :=  186700; -- Replace with your actual application ID
    l_parent_email VARCHAR2(100)    := 'john.doe@gmail.com'; -- Enter your Parent EMail address
    l_admin_email VARCHAR2(100)     := 'schooladm.ocw@gmail.com'; -- Enter your School Admin EMail address
BEGIN
    begin
        apex_util.create_user(
            p_user_name                     => 'JOHN.DOE',
            p_first_name                    => 'John',
            p_last_name                     => 'Doe',
            p_email_address                 => l_parent_email,
            p_web_password                  => l_password,
            p_change_password_on_first_use  => 'N',
            p_allow_app_building_yn         => 'N');
    end;

    begin
        apex_util.create_user(
            p_user_name                     => 'NYC.ADMIN',
            p_first_name                    => 'School',
            p_last_name                     => 'Administrator',
            p_email_address                 => l_admin_email,
            p_web_password                  => l_password,
            p_change_password_on_first_use  => 'N',
            p_allow_app_building_yn         => 'N');

        APEX_ACL.ADD_USER_ROLE (
            p_application_id    => l_app_id,
            p_user_name         => 'NYC.ADMIN',
            p_role_static_id    => 'ADMINISTRATOR' );
        
    end;
END;