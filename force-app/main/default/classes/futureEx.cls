public class futureEx 
{
 @future
    public static void FutureMethodEx()
    {
         //setup obj
        permissionSet ps=[select id,name from permissionSet where name='futureExPermissionSet'limit 1];
        User usr=[SELECT Id, FirstName FROM User where isActive=true limit 1];
        PermissionSetAssignment PSA=new  PermissionSetAssignment();
        PSA.AssigneeId=usr.id;
        PSA.permissionSetId=ps.Id;
        insert PSA;
        //Non setup obj
        Account Acc=[select id,description from Account where name like '%harshitha%' limit 1];
        acc.description='updating after permissionset assigning to a user';
        update Acc;
    }
}