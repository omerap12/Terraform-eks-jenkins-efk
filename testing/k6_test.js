import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 800,
  duration: '10m',
};

export default function () {
  http.get('http://a1dd58729ebce4e5a9b693353f7d6eb4-2088570777.us-east-1.elb.amazonaws.com');
  sleep(1);
}