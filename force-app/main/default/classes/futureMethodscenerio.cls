public class futureMethodscenerio {

    @future
    public static void updateUserRole(Id userId, String roleName) {
        UserRole urList = [SELECT Id, Name FROM UserRole WHERE Name = :roleName  LIMIT 1];

       
      /*  if (urList.isEmpty()) {
            System.debug('No UserRole found with name: ' + roleName);
            return;  
        }*/
        user u = [SELECT Id, Name FROM User WHERE Id = :userId  LIMIT 1];
        urList.Id = u.Id;
       // Id roleId = urList[0].Id;        
        //User usr = new User(Id = userId,UserRoleId = roleId);
        update u;
    }
}