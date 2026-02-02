public class MessagingHelper {

    public static void SendBatchJobNotificationEmail(AsyncApexJob jobDetails,String JobName,Decimal Revenue)

    {

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        String[] toAddress = new String[]{jobDetails.CreatedBy.Email,'vikramtagirisepu@gmail.com'};

            email.setToAddresses(toAddress);

            email.setReplyTo('support@dell.com');

            email.setSenderDisplayName('Dell Support');

        String emailSubject = jobName+''+jobDetails.Id;

        	email.setSubject(emailSubject);

         String emailContent = ''+jobDetails.Id+

             				   ''+jobDetails.Status+

             				   ''+jobDetails.JobItemsProcessed+

                               ''+jobDetails.TotalJobItems+

                               ''+jobDetails.NumberOfErrors+

                               ''+revenue;

        	email.setPlainTextBody(emailContent);

        	Messaging.sendEmail(new messaging.SingleEmailMessage[]{email});   

    }

}