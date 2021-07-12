export interface RspData {
    data?: { [key: string]: any };
    error?: Error;
    status_code: number;
  }
  export interface Error {
    message: string;
    reason_phrase?: string;
  }