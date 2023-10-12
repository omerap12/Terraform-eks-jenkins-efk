import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 200,
  duration: '30s',
};

export default function () {
  http.get('http://afb76ff39267740da9d43120f5d79673-320099975.us-east-1.elb.amazonaws.com');
  sleep(1);
}