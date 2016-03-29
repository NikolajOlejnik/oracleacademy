package main.oracle.academy.fp.service;

import main.oracle.academy.fp.exceptions.RequestException;
import main.oracle.academy.fp.exceptions.TaskException;
import main.oracle.academy.fp.model.Task;
import main.oracle.academy.fp.model.User;

import java.util.List;

public interface TaskService {
    Task create (Task task);
    Task update (Task task) throws TaskException;
    Task getById (Long taskId);
    List <Task> getActualTaskList();
    Boolean acceptRequest(Long taskId, Long requestId) throws TaskException, RequestException;
    Task getTaskWithRequests(Long taskId);
}
