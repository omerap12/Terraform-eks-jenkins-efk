
## How to Run Tests for Auto-Scaling Deployment

This section provides instructions for running tests to evaluate the auto-scaling functionality of the deployment.

# Prerequisites
Make sure you have the following prerequisites installed:

* k6 - A modern load testing tool.

# Setup
Before running the tests, ensure that you have set the LOAD_BALANCER_URL variable in the k6_test.js file to the actual load balancer URL of the deployment.

# Running Tests
To run the tests, execute the following command in your terminal:
```bash
k6 run k6_test.js
```
This command will initiate the tests and evaluate the auto-scaling behavior of the deployment based on the specified configurations in the k6_test.js file.

