# RS-Demo
**##Agenda**

With the docker image **mukeshdreddy/demoimage_0911**, setting up an AWS EKS cluster that supports horizontal
scaling. You can start with a min max number of your choosing.

**##Instructions**

Launching a EKS Cluster

**eksclt create cluster --name democluster --version 1.21 --asg-access**

Install the **Metric Server**

Using the command **kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml**

**Optional:**

I have used the Lens for Kubernetes.

If anyone using the Lens hit this command,

**aws eks update-kubeconfig --name democluster**

Deploy autoscalling-deployment.yaml. This file consists of a deployment file, a service file, and a HorizontalPodAutoscaler. All of these files are deployed by using a single command.

Using this command Creating the HPA with CPU Utilization with a minimum and maximum

**kubectl apply -f autoscalling-deployment.yaml**

To check the load using this command: 

**kubectl get hpa**

Now this is the most interesting part: increasing the load. I have picked up a **busybox image**, because it will automatically run the **wget command**. 
where as in other images like **centos** and **ubuntu** we have to instal the wget command separately.

kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://rotor-studio; done" 

Running the command the watch the load

**kubectl get hpa rotor-studio --watch**

Using this command we see the how pods are running
**kubectl get deployment rotor-studio**

**Detaching:**

Using this command deployment file, a service file, and a HorizontalPodAutoscaler will be deleted 

**kubectl delete -f autoscalling-deployment.yaml**

Final part deleteing the cluster 

**eskctl delete cluster --name democluster**
