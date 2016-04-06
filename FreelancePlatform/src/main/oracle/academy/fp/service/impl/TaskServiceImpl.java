package main.oracle.academy.fp.service.impl;

import main.oracle.academy.fp.dao.RequestDao;
import main.oracle.academy.fp.dao.TaskDao;
import main.oracle.academy.fp.exception.RequestException;
import main.oracle.academy.fp.exception.TaskException;
import main.oracle.academy.fp.model.Request;
import main.oracle.academy.fp.model.Task;
import main.oracle.academy.fp.model.User;
import main.oracle.academy.fp.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskDao taskDao;
    @Autowired
    private RequestDao requestDao;
    @Autowired
    private UserAuthenticationService userAuthenticationService;


    @Override
    public Task create(Task task) {
        User user = userAuthenticationService.getCurrentUser();
        task.setUser(user);
        task.setDateAdded(new Date());
        task.setStatus(true);
        taskDao.add(task);
        return task;
    }

    @Override
    public Task update(Task task) throws TaskException {
        if (getById(task.getId()) != null) {
            taskDao.update(task);
            return task;
        } else throw new TaskException();
    }

    @Override
    public Task getById(Long taskId) {
        return (Task) taskDao.read(taskId);
    }

    @Override
    public Task getTaskWithRequests(Long taskId) {
        return (Task) taskDao.getTaskWithRequests (taskId);
    }

    @Override
    public List<Task> getActualTaskList() {
        return taskDao.getAllActual();
    }

    @Override
    public Boolean acceptRequest(Long taskId, Long requestId) throws TaskException, RequestException {
        Task task = getById(taskId);
        Request request = (Request) requestDao.read(requestId);
        if (task != null) {
            if (request != null) {
                task.setStatus(false);
                request.setStatus(true);
                update(task);
                requestDao.update(request);
                return true;
            } else {
                throw new RequestException();
            }
        } else
            throw new TaskException();
    }

}
