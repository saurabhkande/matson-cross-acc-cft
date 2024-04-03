package example;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

public class HelloLambda implements RequestHandler<Integer, String> {

    @Override
    public String handleRequest(Integer myCount, Context context) {
        return String.valueOf(myCount);
    }

    public String myHandler() {
        return "Helllooo, Welcome to building a CI/CD using cloudformation template !!!! Version 1 !!!!";
    }
}
