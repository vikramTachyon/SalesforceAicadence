public class RemovePIISchedule implements Schedulable {
    public void execute(SchedulableContext sc) {
        RemovePIIBatch batch = new RemovePIIBatch();
        Database.executeBatch(batch);
    }
}